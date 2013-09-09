class AddInscrevivelToInscricoesGenericas < ActiveRecord::Migration
  def change
    add_column :inscricoes_genericas, :inscrevivel_id, :integer
    add_column :inscricoes_genericas, :inscrevivel_type, :string
  end
end
