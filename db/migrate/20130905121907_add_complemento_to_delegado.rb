class AddComplementoToDelegado < ActiveRecord::Migration
  def change
    add_column :delegados, :complemento, :string
  end
end
