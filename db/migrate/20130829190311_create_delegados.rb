class CreateDelegados < ActiveRecord::Migration
  def change
    create_table :delegados do |t|
      t.string :nome, :null => false
      t.string :data_de_nascimento, :null => false
      t.string :cidade, :null => false
      t.string :uf, :limit => 2, :null => false
      t.string :instituicao, :null => false
      t.string :curso, :null => false
      t.integer :periodo, :null => false
      t.string :email, :null => false
      t.string :telefone, :null => false
      t.boolean :socio_anet, :default => false
      t.string :codigo_anet, :null => true

      t.timestamps
    end
  end
end
