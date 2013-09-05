require 'spec_helper'
require 'date'

describe "Bnb" do
  let(:boleto) do
    Boleto.boleto do
      datas do
        vencimento    DateTime.now.to_date
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
        nome     "Bruno"
        cpf      "042.209.704-79"
        endereco "Endereco"
        bairro   "Bairro"
        cep      "58402-030"
        cidade   "Campina Grande"
      end
      documento do
        numero 123456
        especie "DM"
      end
      moeda 9
      valor 128.5
      locaisPagamento ["Pagar ate o vencimento", "Nao receber apos a data de vencimento"]
      instrucoes ["A", "B", "C"]
    end 
  end
  
  let(:bnb) { Banco::Bnb.new(boleto) }
  
  it "should exist a Bnb class" do
    Banco::Bnb.should_not be_nil
  end
  
  it "has a DATA_BASE_INICIAL constant" do
    Banco::Bnb::DATA_BASE_INICIAL.should_not be_nil
  end
  
  it "has a NUMERO_BANCO constant" do
    Banco::Bnb::NUMERO_BANCO.should_not be_nil
  end
  
  it "NUMERO_BANCO constant should be 4" do
    Banco::Bnb::NUMERO_BANCO.should == 4
  end
  
  it "has a TEMPLATE_NAME constant" do
    Banco::Bnb::TEMPLATE_NAME.should_not be_nil
  end
  
  it "should calculate nosso numero accordingly" do
    bnb.nosso_numero.should == '3123456'
  end
  
  it "should calculate nosso numero dv accordingly" do
    bnb.nosso_numero_dv.should == 9
  end
  
  it "should calculate fator vencimento accordingly" do
    bnb.fator_vencimento.should == 5812
  end
  
  it "should calculate campo livre accordingly" do
    bnb.campo_livre.should == '02004715231234569001'
  end

  it "should calculate valor formatado accordingly" do
    bnb.valor_formatado.should == '0000012850'
  end

  it "should calculate codigo de barras sem dv accordingly" do
    bnb.codigo_de_barras_sem_dv.should == '00490581200000128500009004715293123456951000'
  end
  
  it "should calculate codigo de barras accordingly" do
    bnb.codigo_de_barras.should == '00493581200000128500009004715293123456951000'
  end
  
  it "should calculate linha digitavel accordingly" do
    bnb.linha_digitavel.join(' ').should == '00490.00904 04715.293124 34569.510000 3 58120000012850'
  end
end
