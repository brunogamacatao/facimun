class AddMissingFieldsToInscricoesSemanaArquitetura < ActiveRecord::Migration
  def change
    add_column :inscricoes_semana_arquitetura, :endereco, :string
    add_column :inscricoes_semana_arquitetura, :bairro, :string
    add_column :inscricoes_semana_arquitetura, :cep, :string
  end
end
