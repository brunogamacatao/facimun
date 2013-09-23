class RemoveDelegadoFromInscricoes < ActiveRecord::Migration
  def up
    remove_column :inscricoes, :delegado_a_id
    remove_column :inscricoes, :delegado_b_id
  end

  def down
    add_column :inscricoes, :delegado_b_id, :int
    add_column :inscricoes, :delegado_a_id, :int
  end
end
