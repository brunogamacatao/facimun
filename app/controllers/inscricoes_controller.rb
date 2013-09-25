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
    
    Cargo.all.each do |cargo|
      @inscricao.preferencia_cargos << PreferenciaCargo.new(:inscricao => @inscricao, :cargo => cargo)
    end
  end
  
  def create
    @inscricao = Inscricao.new(params[:inscricao])
    
    if @inscricao.comite
      if @inscricao.comite.id == 1
        @inscricao.preferencia_cargos = []
      else
        @inscricao.preferencia_paises = []
      end
    end
      
    if @inscricao.save
      inscrevivel = InscricaoGenerica.create! { |i| i.inscrevivel = @inscricao }
      inscrevivel.titulos << Titulo.create(inscricao_generica_id: @inscricao, data_de_vencimento: 3.days.from_now.to_date, valor: 40.0)
      redirect_to @inscricao, notice: 'Sua inscrição foi realizada com sucesso.'
    else
      if @inscricao.comite
        if @inscricao.comite.id == 1
          Cargo.all.each do |cargo|
            @inscricao.preferencia_cargos << PreferenciaCargo.new(:inscricao => @inscricao, :cargo => cargo)
          end
        else
          Pais.all.each do |pais|
            @inscricao.preferencia_paises << PreferenciaPais.new(:inscricao => @inscricao, :pais => pais)
          end
        end
      end
      
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
