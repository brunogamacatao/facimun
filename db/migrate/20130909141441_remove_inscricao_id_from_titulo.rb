class RemoveInscricaoIdFromTitulo < ActiveRecord::Migration
  def up
    remove_column :titulos, :inscricao_id
  end

  def down
    add_column :titulos, :inscricao_id, :string
  end
end
