class CreatePreferenciaCargos < ActiveRecord::Migration
  def change
    create_table :preferencia_cargos do |t|
      t.references :inscricao
      t.references :cargo
      t.integer :preferencia

      t.timestamps
    end
    add_index :preferencia_cargos, :inscricao_id
    add_index :preferencia_cargos, :cargo_id
  end
end
