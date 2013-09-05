class AddCpfToDelegado < ActiveRecord::Migration
  def change
    add_column :delegados, :cpf, :string
  end
end
