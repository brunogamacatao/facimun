#encoding: utf-8
class InscricoesController < ApplicationController
  def index
    redirect_to action: :new
  end
  
  def new
    @inscricao = Inscricao.new
    @inscricao.delegado = Delegado.new
    
    Pais.all.each do |pais|
      @inscricao.preferencia_paises << PreferenciaPais.new(:inscricao => @inscricao, :pais => pais)
    end
  end
  
  def create
    @inscricao = Inscricao.new(params[:inscricao])
    if @inscricao.save
      inscrevivel = InscricaoGenerica.create! { |i| i.inscrevivel = @inscricao }
      inscrevivel.titulos << Titulo.create(inscricao_generica_id: @inscricao, data_de_vencimento: 3.days.from_now.to_date, valor: 128.5)
      redirect_to @inscricao, notice: 'Sua inscrição foi realizada com sucesso.'
    else
      render action: "new"
    end
  end
  
  def show
    @inscricao = Inscricao.find(params[:id])
  end
  
  def boleto
    @inscricao = Inscricao.find(params[:inscricao_id])
    @titulo    = @inscricao.titulos.last
    render :layout => 'boleto', template: "boletos/bnb"
  end
end
