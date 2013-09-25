#encoding: utf-8
class PreferenciaCargo < ActiveRecord::Base
  belongs_to :inscricao
  belongs_to :cargo
  attr_accessible :preferencia, :inscricao, :cargo, :cargo_id
  accepts_nested_attributes_for :inscricao, :cargo
  
  validates_presence_of :preferencia, :message => "Você deve informar sua preferência para este cargo"
end
