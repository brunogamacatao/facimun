#encoding: utf-8
require 'date'
require 'barby/barcode/code_25_interleaved'
require 'bnb'

class Titulo < ActiveRecord::Base
  include HasBarcode  
  
  belongs_to :inscricao
  attr_accessible :data_de_vencimento, :valor, :inscricao_id
  
  def boleto
    Boleto.boleto do
      datas do
        vencimento    data_de_vencimento
        documento     DateTime.now.to_date
        processamento DateTime.now.to_date
      end
      cedente do
        cedente  "Centro de Ensino Superior e Desenvolvimento"
        cnpj     "02.108.023.0001/40"
        agencia  9
        conta    47152
        convenio 10
        carteira 51
        operacao 2
      end
      sacado do
        nome     inscricao.delegado_a.nome
        cpf      inscricao.delegado_a.cpf
        endereco inscricao.delegado_a.endereco
        bairro   inscricao.delegado_a.bairro
        cep      inscricao.delegado_a.cep
        cidade   [inscricao.delegado_a.cidade, inscricao.delegado_a.uf]
      end
      documento do
        numero id
        especie "DM"
      end
      moeda 9
      valor valor
      locaisPagamento ["Pagar até o vencimento",
                       "Não receber após a data de vencimento"]
      instrucoes ["Não receber após a data de vencimento",
                  "&nbsp;",
                  "CESED - CNPJ: 02.108.023.0001/40",
                  "Av. Senador Argemiro de Figueiredo, 1901 - Itararé",
                  "CEP: 58411-020, Campina Grande/PB"]
    end 
  end
  
  def banco
    Banco::Bnb.new(boleto)
  end
  
  has_barcode :codigo_de_barras,
    :outputter => :svg,
    :type => :code_25_interleaved,
    :value => Proc.new { |p| "#{p.banco.codigo_de_barras}" }
end