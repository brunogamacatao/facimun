class RelatoriosController < ApplicationController
  def index
    @inscricoes = Inscricao.all
  end
end
