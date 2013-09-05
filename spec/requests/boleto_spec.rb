require 'spec_helper'

describe "Boleto" do
  it "should exist a module named Boleto" do
    Boleto.should_not be_nil
  end
  
  it "should exist a class named BoletoData inside module Boleto" do
    Boleto::BoletoData.should_not be_nil
  end
  
  it "should be able to create a Boleto from a DSL" do
    b = Boleto.boleto do
      datas do
        vencimento "15/02/1982"
        documento "21/10/1978"
        processamento "10/10/2013"
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
        nome     "Bruno"
        cpf      "042.209.704-79"
        endereco "Endereco"
        bairro   "Bairro"
        cep      "58402-030"
        cidade   "Campina Grande"
      end
      documento do
        numero "123456"
        especie "DM"
      end
      valor 128.90
      locaisPagamento ["Pagar ate o vencimento", "Nao receber apos a data de vencimento"]
      instrucoes ["A", "B", "C"]
    end 
    
    b.should_not be_nil
  end
end
