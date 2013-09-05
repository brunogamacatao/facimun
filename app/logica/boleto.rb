module Boleto
  DataBoleto = Struct.new(:vencimento, :documento, :processamento)

  class DataBoletoBuilder
    def vencimento(v);    @vencimento    = v; end;
    def documento(v);     @documento     = v; end;
    def processamento(v); @processamento = v; end;
  
    def build
      DataBoleto.new(@vencimento, @documento, @processamento)
    end
  end
  
  Cedente = Struct.new(:cedente, :cnpj, :agencia, :conta, :convenio, :carteira, :operacao, :nosso_numero)
  
  class CedenteBuilder
    def cedente(v);            @cedente      = v; end;
    def cnpj(v);               @cnpj         = v; end;
    def agencia(v);            @agencia      = v; end;
    def conta(v);              @conta        = v; end;
    def convenio(v);           @convenio     = v; end;
    def carteira(v);           @carteira     = v; end;
    def operacao(v);           @operacao     = v; end;
    def nosso_numero(v = nil); @nosso_numero = v; end;
    
    def build
      Cedente.new(@cedente, @cnpj, @agencia, @conta, @convenio, @carteira, @operacao, @nosso_numero)
    end
  end
  
  Sacado = Struct.new(:nome, :cpf, :endereco, :bairro, :cep, :cidade)
  
  class SacadoBuilder
    def nome(v);     @nome = v;     end;
    def cpf(v);      @cpf = v;      end;
    def endereco(v); @endereco = v; end;
    def bairro(v);   @bairro = v;   end;
    def cep(v);      @cep = v;      end;
    def cidade(v);   @cidade = v;   end;
    
    def build
      Sacado.new(@nome, @cpf, @endereco, @bairro, @cep, @cidade)
    end
  end
  
  Documento = Struct.new(:numero, :especie, :parcela)
  
  class DocumentoBuilder
    def numero(v);      @numero = v;  end;
    def especie(v);     @especie = v; end;
    def parcela(v = 1); @parcela = v; end;
    
    def build
      Documento.new(@numero, @especie, @parcela)
    end
  end
  
  BoletoData = Struct.new(:datas, :cedente, :sacado, :documento, :locaisPagamento, :instrucoes, :aceite, :moeda, :valor)

  class BoletoBuilder
    def datas(&block)
      @datas = Docile.dsl_eval(DataBoletoBuilder.new, &block).build
    end
    def cedente(&block)
      @cedente = Docile.dsl_eval(CedenteBuilder.new, &block).build
    end
    def sacado(&block)
      @sacado = Docile.dsl_eval(SacadoBuilder.new, &block).build
    end
    def documento(&block)
      @documento = Docile.dsl_eval(DocumentoBuilder.new, &block).build
    end
    def locaisPagamento(v = []); @locaisPagamento = v; end;
    def instrucoes(v = []);      @instrucoes      = v; end;
    def aceite(v = 'S');         @aceite          = v; end;
    def moeda(v = 9);            @moeda           = v; end;
    def valor(v = 0.0);          @valor           = v; end;
  
    def build
      BoletoData.new(@datas, @cedente, @sacado, @documento, @locaisPagamento, @instrucoes, @aceite, @moeda, @valor)
    end
  end
  
  def Boleto.boleto(&block)
    Docile.dsl_eval(BoletoBuilder.new, &block).build
  end
end