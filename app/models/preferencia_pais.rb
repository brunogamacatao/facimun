#encoding: utf-8

class PreferenciaPais < ActiveRecord::Base
  belongs_to :inscricao
  belongs_to :pais
  attr_accessible :preferencia, :inscricao, :pais, :pais_id
  accepts_nested_attributes_for :inscricao, :pais
  
  validates_presence_of :preferencia, :message => "Você deve informar sua preferência para este país"
end
