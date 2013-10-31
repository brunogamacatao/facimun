class AddMatriculaToInscricoesSemanaArquitetura < ActiveRecord::Migration
  def change
    add_column :inscricoes_semana_arquitetura, :matricula, :string
  end
end
