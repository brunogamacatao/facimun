#encoding: utf-8
class Inscricao < ActiveRecord::Base
  has_one :inscricao_generica, as: :inscrevivel, dependent: :destroy
  
  attr_accessible :delegado_id, :comite_id, :justificativa
  attr_accessible :delegado_attributes, :preferencia_paises_attributes, :preferencia_cargos_attributes

  belongs_to :delegado
  belongs_to :comite
  
  has_many :preferencia_paises
  has_many :preferencia_cargos
  
  accepts_nested_attributes_for :delegado, :preferencia_paises, :preferencia_cargos
  
  delegate :titulos, to: :inscricao_generica
  def sacado; delegado; end;
  
  validates_presence_of :comite_id, :message => "É obrigatório informar o comitê"
  # validates_presence_of :justificativa, :if => :precisa_de_justificativa?
  # validates_presence_of :justificativa, :message => "Você deve informar os motivos pelos quais prefere estes países"
end
