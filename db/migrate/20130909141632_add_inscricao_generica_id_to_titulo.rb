class AddInscricaoGenericaIdToTitulo < ActiveRecord::Migration
  def change
    add_column :titulos, :inscricao_generica_id, :integer
  end
end
