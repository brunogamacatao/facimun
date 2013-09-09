class CreateInscricoesGenericas < ActiveRecord::Migration
  def change
    create_table :inscricoes_genericas do |t|

      t.timestamps
    end
  end
end
