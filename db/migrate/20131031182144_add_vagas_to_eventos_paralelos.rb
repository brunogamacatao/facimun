class AddVagasToEventosParalelos < ActiveRecord::Migration
  def change
    add_column :eventos_paralelos, :vagas, :integer
  end
end
