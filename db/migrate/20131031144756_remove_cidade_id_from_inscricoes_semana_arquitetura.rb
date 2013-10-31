class RemoveCidadeIdFromInscricoesSemanaArquitetura < ActiveRecord::Migration
  def up
    remove_column :inscricoes_semana_arquitetura, :cidade_id
  end

  def down
    add_column :inscricoes_semana_arquitetura, :cidade_id, :integer
  end
end
