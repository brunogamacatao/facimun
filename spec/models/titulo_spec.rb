require 'spec_helper'

describe "Titulo" do
  it "should have a boleto" do
    titulo = FactoryGirl.create(:titulo)
    titulo.boleto.should_not be_nil
  end
  
  it "should have a banco" do
    titulo = FactoryGirl.create(:titulo)
    titulo.banco.should_not be_nil
  end
  
  it "should calculate the barcode accordingly" do
    titulo = FactoryGirl.create(:titulo)
    titulo.banco.codigo_de_barras.should_not be_nil
  end
  
  it "should generate the barcode picture" do
    titulo = FactoryGirl.create(:titulo)
    titulo.codigo_de_barras.should_not be_nil
  end
end