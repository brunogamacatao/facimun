class CreateInscricoes < ActiveRecord::Migration
  def change
    create_table :inscricoes do |t|
      t.integer :delegado_a_id
      t.integer :delegado_b_id

      t.timestamps
    end
    
    add_index :inscricoes, :delegado_a_id
    add_index :inscricoes, :delegado_b_id
  end
end
