class AddComiteIdToInscricoes < ActiveRecord::Migration
  def change
    add_column :inscricoes, :comite_id, :integer
    add_index :inscricoes, :comite_id
  end
end
