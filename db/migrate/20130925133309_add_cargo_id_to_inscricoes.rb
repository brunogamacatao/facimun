class AddCargoIdToInscricoes < ActiveRecord::Migration
  def change
    add_column :inscricoes, :cargo_id, :integer
  end
end
