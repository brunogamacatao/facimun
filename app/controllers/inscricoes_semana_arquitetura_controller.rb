#encoding: utf-8
class InscricoesSemanaArquiteturaController < ApplicationController
  def index
    redirect_to action: :new
  end
  
  def new
    @inscricao  = InscricaoSemanaArquitetura.new
    @minicursos = EventoParalelo.where(:tipo_cd => 0).order(:ordem)
    @oficinas   = EventoParalelo.where(:tipo_cd => 1).order(:ordem)
  end
  
  def create
    @inscricao = InscricaoSemanaArquitetura.new(params[:inscricao_semana_arquitetura])
    
    if @inscricao.save
      inscrevivel = InscricaoGenerica.create! { |i| i.inscrevivel = @inscricao }
      
      valor_base = [20, 40, 60][@inscricao.tipo_inscricao_cd]
      valor_por_evento = [20, 25, 50][@inscricao.tipo_inscricao_cd]
      
      valor_inscricao = valor_base + valor_por_evento * @inscricao.eventos_paralelos.count()
      inscrevivel.titulos << Titulo.create(inscricao_generica_id: @inscricao, data_de_vencimento: 1.days.from_now.to_date, valor: valor_inscricao)
      redirect_to @inscricao, notice: 'Sua inscrição foi realizada com sucesso.'
    else
      @minicursos = EventoParalelo.where(:tipo_cd => 0).order(:ordem)
      @oficinas   = EventoParalelo.where(:tipo_cd => 1).order(:ordem)
      render action: "new"
    end
  end
  
  def show
    @inscricao = InscricaoSemanaArquitetura.find(params[:id])
  end
  
  def boleto
    @inscricao = InscricaoSemanaArquitetura.find(params[:inscricao_semana_arquitetura_id])
    @titulo    = @inscricao.titulos.last
    render :layout => 'boleto', template: "boletos/bnb"
  end
end
