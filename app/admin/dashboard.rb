#encoding: utf-8
ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => "Início"

  content :title => "Início" do

    columns do
      column do
        panel "Últimas Inscrições" do
          table_for Titulo.last(5) do 
            column("Nome")   {|titulo| link_to(titulo.sacado.nome, admin_titulo_path(titulo)) } 
            column("Valor")  {|titulo| number_to_currency(titulo.valor, :unit => "R$ ", :separator => ",", :delimiter => ".") } 
            column("Estado") {|titulo| status_tag(titulo.pago ? "PAGO" : "PENDENTE", titulo.pago ? :ok : :error) } 
          end
          h3 "#{Titulo.count} inscrições realizadas (#{Titulo.where(:pago => true).count} pagas)"
        end
      end

      column do
        panel "Pagamentos" do
          link_to("Novo Pagamento", new_admin_pagamento_path, class: "button")
        end
      end
    end
  end # content
end
