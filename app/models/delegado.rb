#encoding: utf-8
class Delegado < ActiveRecord::Base
  attr_accessible :cidade, :codigo_anet, :curso, :data_de_nascimento, :email, :instituicao, :nome, :periodo, :socio_anet, :telefone, :uf
  has_many :paises, through: :delegados_paises
  
  validates_presence_of :nome, :data_de_nascimento, :cidade, :uf, :instituicao, :curso, :periodo, :email, :telefone
  validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, :message => "O e-mail informado é inválido"
  validates_format_of :telefone, :with => /^\(\d{2}\)\d{4}-\d{4}$/, :message => "O telefone informado é inválido"
  validates_inclusion_of :uf, :in => lambda { |d| Estado.select(:sigla).map{|e| e.sigla} }, :message => "O estado informado é inválido"
  validates_presence_of :codigo_anet, :if => :socio_anet?
  
  def socio_anet?
    socio_anet
  end
end
