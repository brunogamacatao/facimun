require 'spec_helper'

describe "BoletoUtils" do
  it "should exist a BoletoUtils module" do
    BoletoUtils.should_not be_nil
  end
  
  it "calculates modulus 10 accordingly" do
    # this test is based on already tested output of the Groovy implementation
    BoletoUtils.calculaModulo10('0').should == 0
    BoletoUtils.calculaModulo10('01').should == 8
    BoletoUtils.calculaModulo10('012').should == 5
    BoletoUtils.calculaModulo10('0123').should == 0
    BoletoUtils.calculaModulo10('01234').should == 4
    BoletoUtils.calculaModulo10('012345').should == 5
    BoletoUtils.calculaModulo10('0123456').should == 6
    BoletoUtils.calculaModulo10('01234567').should == 4
    BoletoUtils.calculaModulo10('012345678').should == 2
    BoletoUtils.calculaModulo10('0123456789').should == 7
  end
  
  it "calculates modulus 11 accordingly" do
    # this test is based on already tested output of the Groovy implementation
    BoletoUtils.calculaModulo11('0').should == 0
    BoletoUtils.calculaModulo11('01').should == 9
    BoletoUtils.calculaModulo11('012').should == 4
    BoletoUtils.calculaModulo11('0123').should == 6
    BoletoUtils.calculaModulo11('01234').should == 3
    BoletoUtils.calculaModulo11('012345').should == 5
    BoletoUtils.calculaModulo11('0123456').should == 0
    BoletoUtils.calculaModulo11('01234567').should == 9
    BoletoUtils.calculaModulo11('012345678').should == 9
    BoletoUtils.calculaModulo11('0123456789').should == 7
  end

  it "should truncate the values accordingly" do
    # this test is based on already tested output of the Groovy implementation
    BoletoUtils.truncate(   1, 1).should == '1'
    BoletoUtils.truncate(   1, 2).should == '01'
    BoletoUtils.truncate(   1, 3).should == '001'
    BoletoUtils.truncate(  92, 1).should == '2'
    BoletoUtils.truncate(  92, 2).should == '92'
    BoletoUtils.truncate(  92, 3).should == '092'
    BoletoUtils.truncate( 123, 1).should == '3'
    BoletoUtils.truncate( 123, 2).should == '23'
    BoletoUtils.truncate( 123, 3).should == '123'
    BoletoUtils.truncate(4321, 1).should == '1'
    BoletoUtils.truncate(4321, 2).should == '21'
    BoletoUtils.truncate(4321, 3).should == '321'
  end
  
end
