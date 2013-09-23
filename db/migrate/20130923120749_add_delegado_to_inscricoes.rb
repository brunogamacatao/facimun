class AddDelegadoToInscricoes < ActiveRecord::Migration
  def change
    add_column :inscricoes, :delegado_id, :integer
    add_index :inscricoes, :delegado_id
  end
end
