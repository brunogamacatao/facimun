class AddBairroToDelegado < ActiveRecord::Migration
  def change
    add_column :delegados, :bairro, :string
  end
end
