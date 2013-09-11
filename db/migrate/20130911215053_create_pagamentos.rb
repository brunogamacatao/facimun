class CreatePagamentos < ActiveRecord::Migration
  def change
    create_table :pagamentos do |t|
      t.decimal :valor
      t.references :titulo

      t.timestamps
    end
    add_index :pagamentos, :titulo_id
  end
end
