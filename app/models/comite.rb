class Comite < ActiveRecord::Base
  attr_accessible :nome, :vagas
  has_many :inscricoes
  
  def vagas_restantes
    vagas - inscricoes.count
  end
  
  def to_s
    "#{nome} - Vagas: #{vagas_restantes}"
  end
end
