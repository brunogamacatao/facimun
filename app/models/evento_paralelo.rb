class EventoParalelo < ActiveRecord::Base
  attr_accessible :horario, :nome, :tipo_cd, :ordem
  
  # Relacionamentos
  has_many :inscricoes_evento_arquitetura, :through => :EventosParalelosInscricoesSemanaArquitetura
end
