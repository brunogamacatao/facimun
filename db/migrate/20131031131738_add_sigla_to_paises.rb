class AddSiglaToPaises < ActiveRecord::Migration
  def change
    add_column :paises, :sigla, :string
  end
end
