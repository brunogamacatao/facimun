class CreateComites < ActiveRecord::Migration
  def change
    create_table :comites do |t|
      t.string :nome
      t.integer :vagas

      t.timestamps
    end
  end
end
