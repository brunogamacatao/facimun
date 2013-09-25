class RemoveCargoIdFromInscricoes < ActiveRecord::Migration
  def up
    remove_column :inscricoes, :cargo_id
  end

  def down
    add_column :inscricoes, :cargo_id, :integer
  end
end
