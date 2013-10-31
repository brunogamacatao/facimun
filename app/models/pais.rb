class Pais < ActiveRecord::Base
  attr_accessible :nome, :sigla, :created_at, :updated_at
  has_many :estados
end
