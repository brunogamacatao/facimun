module ApplicationHelper
  def reais(valor)
    number_to_currency(valor, :unit => "R$ ", :separator => ",", :delimiter => ".")
  end
  
  def data(valor)
    valor.strftime("%d/%m/%Y")
  end
end
