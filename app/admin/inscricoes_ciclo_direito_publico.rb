#encoding: utf-8
ActiveAdmin.register InscricaoCicloDireitoPublico do
  menu :label => "Inscrições Ciclo de Direito Público"
  
  index do
    column("Data", :sortable => :created_at) { |inscricao| inscricao.created_at.strftime("%d/%m/%Y") }
    column("Nome") { |inscricao| link_to inscricao.nome, admin_inscricao_ciclo_direito_publico_path(inscricao) }
    column("CPF") { |inscricao| link_to inscricao.cpf, admin_inscricao_ciclo_direito_publico_path(inscricao) }
    column("Instituição") { |inscricao| link_to inscricao.instituicao, admin_inscricao_ciclo_direito_publico_path(inscricao) }
    column("Estado") do |inscricao|
      status_tag(inscricao.ultimo_titulo.try(:pago) ? "PAGO" : "PENDENTE", inscricao.ultimo_titulo.try(:pago) ? :ok : :error)
    end
  end
  
  scope "Todas", :all, :default => true
  scope :pagas do |inscricoes|
    inscricoes.joins(inscricao_generica: [:titulos]).where(titulos: {pago: true}).order("created_at DESC")
  end
  
end
