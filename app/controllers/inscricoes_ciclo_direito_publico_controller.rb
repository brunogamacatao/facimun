#encoding: utf-8
class InscricoesCicloDireitoPublicoController < ApplicationController
  def index
    redirect_to action: :new
  end
  
  def new
    @inscricao = InscricaoCicloDireitoPublico.new
  end
  
  def create
    @inscricao = InscricaoCicloDireitoPublico.new(params[:inscricao_ciclo_direito_publico])
    if @inscricao.save
      inscrevivel = InscricaoGenerica.create! { |i| i.inscrevivel = @inscricao }
      valor_inscricao = @inscricao.aluno_facisa ? 20.0 : 30.0
      inscrevivel.titulos << Titulo.create(inscricao_generica_id: @inscricao, data_de_vencimento: 3.days.from_now.to_date, valor: valor_inscricao)
      redirect_to @inscricao, notice: 'Sua inscrição foi realizada com sucesso.'
    else
      render action: "new"
    end
  end
  
  def show
    @inscricao = InscricaoCicloDireitoPublico.find(params[:id])
  end
  
  def boleto
    @inscricao = InscricaoCicloDireitoPublico.find(params[:inscricao_ciclo_direito_publico_id])
    @titulo    = @inscricao.titulos.last
    render :layout => 'boleto'#, template: "boletos/bnb"
  end
end
