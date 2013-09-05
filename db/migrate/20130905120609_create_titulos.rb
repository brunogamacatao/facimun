class CreateTitulos < ActiveRecord::Migration
  def change
    create_table :titulos do |t|
      t.date :data_de_vencimento
      t.decimal :valor
      t.references :inscricao

      t.timestamps
    end
    add_index :titulos, :inscricao_id
  end
end
