class AddUfToInscricoesSemanaArquitetura < ActiveRecord::Migration
  def change
    add_column :inscricoes_semana_arquitetura, :uf, :string
  end
end
