class AddMissingFieldsToInscricoesCicloDireitoPublico < ActiveRecord::Migration
  def change
    add_column :inscricoes_ciclo_direito_publico, :aluno_facisa, :boolean
    add_column :inscricoes_ciclo_direito_publico, :matricula, :integer
  end
end
