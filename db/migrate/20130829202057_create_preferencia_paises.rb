class CreatePreferenciaPaises < ActiveRecord::Migration
  def change
    create_table :preferencia_paises do |t|
      t.references :inscricao
      t.references :pais
      t.integer :preferencia

      t.timestamps
    end
    add_index :preferencia_paises, :inscricao_id
    add_index :preferencia_paises, :pais_id
  end
end
