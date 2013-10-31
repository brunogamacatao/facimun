class UpdateVagasFromEventosParalelos < ActiveRecord::Migration
  def up
    EventoParalelo.update_all(:vagas => 50)
  end

  def down
  end
end
