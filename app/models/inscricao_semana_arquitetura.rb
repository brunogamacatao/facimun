#encoding: utf-8
class InscricaoSemanaArquitetura < ActiveRecord::Base
  # Relacao polimorfica
  has_one :inscricao_generica, as: :inscrevivel, dependent: :destroy
  
  # Relacionamentos
  has_many :eventos_paralelos_inscricoes_semana_arquitetura, :class_name => EventosParalelosInscricoesSemanaArquitetura
  has_many :eventos_paralelos, :through => :eventos_paralelos_inscricoes_semana_arquitetura
  
  # Acessibilidade dos atributos
  attr_accessible :cpf, :curso, :data_de_nascimento, :email, :instituicao
  attr_accessible :matricula, :nome, :periodo, :telefone, :tipo_inscricao_cd
  attr_accessible :endereco, :bairro, :cep, :complemento, :cidade, :uf
  attr_accessible :evento_paralelo_ids, :matricula
  
  # Atributo necessario para a geracao do boleto
  delegate :titulos, to: :inscricao_generica
  def sacado; self; end;
  
  # Atributos especiais
  as_enum :tipo_inscricao, :aluno_facisa => 0, :aluno_outra_ies => 1, :profissional => 2, :aluno_ufcg => 3, :aluno_ufpb => 4, :aluno_unipe => 5
  
  # Validacoes
  validates_presence_of :nome, :cpf, :endereco, :bairro, :cep, :data_de_nascimento, :cidade, :uf, :instituicao, :curso, :periodo, :email, :telefone
  validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, :message => "O e-mail informado é inválido"
  validates_format_of :telefone, :with => /^\(\d{2}\)\d{4}-\d{4}$/, :message => "O telefone informado é inválido"
  validates_inclusion_of :uf, :in => lambda { |d| Estado.select(:sigla).map{|e| e.sigla} }, :message => "O estado informado é inválido"
  validates_presence_of :tipo_inscricao_cd
  
end
