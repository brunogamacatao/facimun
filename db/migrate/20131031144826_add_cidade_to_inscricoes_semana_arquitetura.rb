class AddCidadeToInscricoesSemanaArquitetura < ActiveRecord::Migration
  def change
    add_column :inscricoes_semana_arquitetura, :cidade, :string
  end
end
