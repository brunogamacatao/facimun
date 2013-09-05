class Inscricao < ActiveRecord::Base
  attr_accessible :delegado_a_id, :delegado_b_id
  attr_accessible :delegado_a_attributes, :delegado_b_attributes, :preferencia_paises_attributes
  
  belongs_to :delegado_a, :class_name => "Delegado", :foreign_key => "delegado_a_id"
  belongs_to :delegado_b, :class_name => "Delegado", :foreign_key => "delegado_b_id"
  
  has_many :preferencia_paises
  has_many :titulos
  
  accepts_nested_attributes_for :delegado_a, :delegado_b, :preferencia_paises
end
