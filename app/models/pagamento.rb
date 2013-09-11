class Pagamento < ActiveRecord::Base
  belongs_to :titulo
  attr_accessible :valor, :titulo_id
  accepts_nested_attributes_for :titulo
  
  after_create :confirma_titulo
  def confirma_titulo
    if valor >= titulo.valor
      titulo.pago = true
      titulo.save!
    end
  end
end
