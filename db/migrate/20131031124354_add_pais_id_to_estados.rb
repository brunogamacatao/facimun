class AddPaisIdToEstados < ActiveRecord::Migration
  def change
    add_column :estados, :pais_id, :int
  end
end
