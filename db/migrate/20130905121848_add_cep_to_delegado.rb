class AddCepToDelegado < ActiveRecord::Migration
  def change
    add_column :delegados, :cep, :string
  end
end
