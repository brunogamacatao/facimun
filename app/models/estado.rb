class Estado < ActiveRecord::Base
  attr_accessible :nome, :sigla, :pais_id, :created_at, :updated_at
  belongs_to :pais
  has_many :cidades
  
  def to_s
    sigla
  end
end
