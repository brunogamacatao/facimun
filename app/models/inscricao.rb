#encoding: utf-8
class Inscricao < ActiveRecord::Base
  has_one :inscricao_generica, as: :inscrevivel, dependent: :destroy
  
  attr_accessible :delegado_id, :comite_id
  attr_accessible :delegado_attributes, :preferencia_paises_attributes
  
  belongs_to :delegado, :class_name => "Delegado", :foreign_key => "delegado_id"
  
  has_many :preferencia_paises
  belongs_to :comite
  
  accepts_nested_attributes_for :delegado, :preferencia_paises
  
  delegate :titulos, to: :inscricao_generica
  def sacado; delegado; end;
  
  validates_presence_of :comite_id, :message => "É obrigatório informar o comitê"
end
