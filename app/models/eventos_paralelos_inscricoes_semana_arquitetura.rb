class EventosParalelosInscricoesSemanaArquitetura < ActiveRecord::Base
  belongs_to :evento_paralelo
  belongs_to :inscricao_semana_arquitetura
  # attr_accessible :title, :body
end
