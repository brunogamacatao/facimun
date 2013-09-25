class Cargo < ActiveRecord::Base
  attr_accessible :nome
  
  def to_s;nome;end;
end
