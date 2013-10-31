#encoding: utf-8
class CreateEventosParalelos < ActiveRecord::Migration
  def change
    create_table :eventos_paralelos do |t|
      t.integer :ordem
      t.string :nome
      t.integer :tipo_cd
      t.string :horario

      t.timestamps
    end
    
    EventoParalelo.create!(ordem: 1, nome: 'Gestão de Escritórios de Arquitetura - 6h/a', tipo_cd: 0)
    EventoParalelo.create!(ordem: 1, nome: 'Design de Móveis/Produtos 3h/a', tipo_cd: 1)
    EventoParalelo.create!(ordem: 2, nome: 'Luminotécnica e Automação 3h/a', tipo_cd: 1)
    EventoParalelo.create!(ordem: 3, nome: 'Projeto Modulado na Arquitetura de Interiores 3h/a', tipo_cd: 1)
    EventoParalelo.create!(ordem: 4, nome: 'Circulação Vertical em Edificações 3h/a', tipo_cd: 1)
    EventoParalelo.create!(ordem: 5, nome: 'A Arte da Fotografia na Arquitetura 3h/a', tipo_cd: 1)
  end
end
