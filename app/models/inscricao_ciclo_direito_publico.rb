#encoding: utf-8
class InscricaoCicloDireitoPublico < ActiveRecord::Base
  has_one :inscricao_generica, as: :inscrevivel, dependent: :destroy
  
  attr_accessible :bairro, :cep, :cidade, :complemento, :cpf, :curso, :data_de_nascimento, :email, :endereco, :instituicao, :nome, :periodo, :telefone, :uf, :aluno_facisa, :matricula

  validates_presence_of :nome, :cpf, :endereco, :bairro, :cep, :data_de_nascimento, :cidade, :uf, :instituicao, :curso, :periodo, :email, :telefone
  validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, :message => "O e-mail informado é inválido"
  validates_format_of :telefone, :with => /^\(\d{2}\)\d{4}-\d{4}$/, :message => "O telefone informado é inválido"
  validates_inclusion_of :uf, :in => lambda { |d| Estado.select(:sigla).map{|e| e.sigla} }, :message => "O estado informado é inválido"
  validates_presence_of :matricula, :if => :aluno_facisa?

  delegate :titulos, to: :inscricao_generica
  def sacado; self; end;
  
  def aluno_facisa?
    aluno_facisa
  end
end
