class AddJustificativaToInscricoes < ActiveRecord::Migration
  def change
    add_column :inscricoes, :justificativa, :text
  end
end
