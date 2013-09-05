class AddEnderecoToDelegado < ActiveRecord::Migration
  def change
    add_column :delegados, :endereco, :string
  end
end
