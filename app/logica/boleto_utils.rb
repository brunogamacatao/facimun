module BoletoUtils
  def BoletoUtils.calculaModulo10(valor)
    total = 0
    fator = (valor.length % 2) == 0 ? 1 : 2
    
    valor.length.times do |i|
      resultado = valor[i].to_i * fator
      fator += 1
      resultado = resultado.to_s[0].to_i + resultado.to_s[1].to_i if resultado >= 10
      total += resultado
      fator = 1 if fator > 2
    end
    
    mod = 10 - (total % 10)
    mod = 0 if (mod >= 10)
    
    return mod
  end
  
  def BoletoUtils.calculaModulo11(valor, base = 9, r = 0)
    soma  = 0
    fator = 2
    
    (valor.length - 1).downto(0) do |i|
      numero  = valor[i].to_i
      parcial = numero * fator
      soma += parcial
      fator = 1 if (fator == base) 
      fator += 1
    end
    
    if (r == 0) then
      soma *= 10
      digito = soma % 11
      digito = 0 if (digito == 10)
      digito
    else
      soma % 11
    end
  end
  
  def BoletoUtils.truncate(value, size)
    str = "%0#{size}d" % value
    str = str[-size .. str.length - 1] if (str.length > size)
    str
  end
end