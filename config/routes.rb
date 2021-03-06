Facimun::Application.routes.draw do
  get "relatorios/index"

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :paises
  resources :estados
  resources :cidades
  
  resources :inscricoes do
    get :boleto, to: "inscricoes#boleto", as: :emitir_boleto
  end
  
  resources :inscricoes_ciclo_direito_publico do
    get :boleto, to: "inscricoes_ciclo_direito_publico#boleto", as: :emitir_boleto
  end
  
  resources :inscricoes_semana_arquitetura do
    get :boleto, to: "inscricoes_semana_arquitetura#boleto", as: :emitir_boleto
  end
end
