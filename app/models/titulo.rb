#encoding: utf-8
require 'date'
require 'barby/barcode/code_25_interleaved'
require 'bnb'

class Titulo < ActiveRecord::Base
  include HasBarcode  
  
  belongs_to :inscricao_generica
  attr_accessible :data_de_vencimento, :valor, :inscricao_generica_id
  
  def inscricao; inscricao_generica.inscrevivel; end;
  def sacado; inscricao_generica.inscrevivel.sacado; end;
  def valor_boleto; valor; end;
  def to_s; id; end;
  
  def boleto
    @boleto ||= Boleto.boleto do
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
        nome     sacado.nome
        cpf      sacado.cpf
        endereco sacado.endereco
        bairro   sacado.bairro
        cep      sacado.cep
        cidade   [sacado.cidade, sacado.uf]
      end
      documento do
        numero id
        especie "DM"
      end
      moeda 9
      valor valor_boleto
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
    @banco ||= Banco::Bnb.new(boleto)
  end
  
  has_barcode :codigo_de_barras,
    :outputter => :svg,
    :type => :code_25_interleaved,
    :value => Proc.new { |p| "#{p.banco.codigo_de_barras}" }
end