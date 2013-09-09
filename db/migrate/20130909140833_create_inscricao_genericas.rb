class CreateInscricaoGenericas < ActiveRecord::Migration
  def change
    create_table :inscricao_genericas do |t|

      t.timestamps
    end
  end
end
