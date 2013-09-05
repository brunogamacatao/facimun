require 'date'

module Banco 
  class Bnb
    DATA_BASE_INICIAL = Date.new(2000, 7, 3)
    NUMERO_BANCO      = 4
    TEMPLATE_NAME     = "/boleto/bnb"
    
    attr_reader :boleto
    attr_reader :data_atual
    
    def initialize(boleto, data_atual = DateTime.now.to_date)
      @boleto = boleto
      @data_atual = data_atual
      @boleto.cedente.nosso_numero = "#{self.nosso_numero}#{self.nosso_numero_dv}"
    end
    
    def nosso_numero
      @data_atual.year.to_s[-1] + BoletoUtils.truncate(@boleto.documento.numero, 6)
    end
    
    def nosso_numero_dv
      BoletoUtils.calculaModulo11 nosso_numero
    end
    
    def fator_vencimento
      @boleto.datas.vencimento - DATA_BASE_INICIAL + 1000
    end
    
    def campo_livre
      ("%02d" % @boleto.cedente.operacao) +
      ("%07d" % @boleto.cedente.conta) +
      @boleto.cedente.nosso_numero +
      ("%03d" % (@boleto.documento.parcela || 1))
    end
    
    def valor_formatado
      "%010d" % (@boleto.valor * 100).to_i
    end
    
    def codigo_de_barras_sem_dv
      ("%03d" % NUMERO_BANCO) + 
      @boleto.moeda.to_s + 
      "0" +
      ("%04d" % self.fator_vencimento) + 
      self.valor_formatado + 
      ("%04d" % @boleto.cedente.agencia) +
      ("%07d" % @boleto.cedente.conta) +
      "9" +
      self.nosso_numero + 
      self.nosso_numero_dv.to_s +
      ("%02d" % @boleto.cedente.carteira) +
      "000"
    end

    def codigo_de_barras
      linha = codigo_de_barras_sem_dv
      "#{linha[0..3]}#{self.calcula_digito_verificador_codigo_de_barras(linha)}#{linha[5..linha.length - 1]}"
    end
    
    def calcula_digito_verificador_codigo_de_barras(numero)
      pesos = '43290876543298765432987654329876543298765432'
      soma  = 0
      numero.length.times do |i|
        soma += numero[i].to_i * pesos[i].to_i
      end
      digito = 11 - (soma % 11)
      digito = 1 if digito >= 10
      digito
    end
    
    def linha_digitavel
      linha = self.codigo_de_barras

      p1 = linha[0..3]
      p2 = linha[19..23]
      p3 = BoletoUtils.calculaModulo10("#{p1}#{p2}")
      p4 = "#{p1}#{p2}#{p3}"
      p5 = p4[0..4]
      p6 = p4[5..p4.length - 1]
      campoA = "#{p5}.#{p6}"

      p1 = linha[24..33]
      p2 = BoletoUtils.calculaModulo10(p1)
      p3 = "#{p1}#{p2}"
      p4 = p3[0..4]
      p5 = p3[5..p3.length - 1]
      campoB = "#{p4}.#{p5}"

      p1 = linha[34..43]
      p2 = BoletoUtils.calculaModulo10(p1)
      p3 = "#{p1}#{p2}"
      p4 = p3[0..4]
      p5 = p3[5..p3.length - 1]
      campoC = "#{p4}.#{p5}"
      campoD = linha[4]
      campoE = linha[5..18]

      [campoA, campoB, campoC, campoD, campoE]
    end
  end
end