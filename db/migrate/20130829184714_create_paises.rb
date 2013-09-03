class CreatePaises < ActiveRecord::Migration
  def change
    create_table :paises do |t|
      t.string :nome

      t.timestamps
    end
  end
end
