class CreateInscricoesCicloDireitoPublico < ActiveRecord::Migration
  def change
    create_table :inscricoes_ciclo_direito_publico do |t|
      t.string :nome
      t.string :cpf
      t.string :data_de_nascimento
      t.string :email
      t.string :telefone
      t.string :endereco
      t.string :bairro
      t.string :cep
      t.string :cidade
      t.string :uf
      t.string :complemento
      t.string :instituicao
      t.string :curso
      t.integer :periodo

      t.timestamps
    end
  end
end
