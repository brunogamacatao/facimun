class AddComplementoToInscricoesSemanaArquitetura < ActiveRecord::Migration
  def change
    add_column :inscricoes_semana_arquitetura, :complemento, :string
  end
end
