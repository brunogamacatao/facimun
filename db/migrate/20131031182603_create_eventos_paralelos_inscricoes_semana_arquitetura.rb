class CreateEventosParalelosInscricoesSemanaArquitetura < ActiveRecord::Migration
  def change
    create_table :eventos_paralelos_inscricoes_semana_arquitetura, :id => false do |t|
      t.references :evento_paralelo
      t.references :inscricao_semana_arquitetura
    end
  end
end
