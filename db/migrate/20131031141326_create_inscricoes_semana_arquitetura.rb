class CreateInscricoesSemanaArquitetura < ActiveRecord::Migration
  def change
    create_table :inscricoes_semana_arquitetura do |t|
      t.string :nome
      t.string :cpf
      t.date :data_de_nascimento
      t.string :email
      t.string :telefone
      t.string :instituicao
      t.references :cidade
      t.string :curso
      t.string :periodo
      t.string :matricula
      t.integer :tipo_inscricao_cd

      t.timestamps
    end
    add_index :inscricoes_semana_arquitetura, :cidade_id
  end
end
