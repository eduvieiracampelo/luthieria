Rails.application.routes.draw do
  resources :servicos
  resources :instrumentos
  resources :clientes
  devise_for :users

  get "busca", to: "busca#index"

  root "dashboard#index"

  get "up" => "rails/health#show", as: :rails_health_check
end
