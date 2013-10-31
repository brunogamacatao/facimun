class Cidade < ActiveRecord::Base
  belongs_to :estado
  attr_accessible :nome, :estado_id, :created_at, :updated_at
  belongs_to :estado
  
  def to_s
    nome
  end
end
