#encoding: utf-8
ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => "Início"

  content :title => "Início" do

    columns do
      column do
        panel "Últimas Inscrições" do
          ul do
            Titulo.last(5).map do |titulo|
              li link_to(titulo.sacado.nome, admin_titulo_path(titulo))
            end
          end
        end
      end

      column do
        panel "Info" do
          para "Welcome to ActiveAdmin."
        end
      end
    end
  end # content
end
