#encoding: utf-8
class InscricoesController < ApplicationController
  def index
    redirect_to action: :new
  end
  
  def new
    @inscricao = Inscricao.new
    @inscricao.delegado_a = Delegado.new
    @inscricao.delegado_b = Delegado.new
    
    Pais.all.each do |pais|
      @inscricao.preferencia_paises << PreferenciaPais.new(:inscricao => @inscricao, :pais => pais)
    end
  end
  
  def create
    @inscricao = Inscricao.new(params[:inscricao])
    if @inscricao.save
      redirect_to @inscricao, notice: 'Sua inscrição foi realizada com sucesso.'
    else
      render action: "new"
    end
  end
  
  def show
    @inscricao = Inscricao.find(params[:id])
  end
end
