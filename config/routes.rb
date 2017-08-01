Rails.application.routes.draw do
  resources :comments
  resources :articles
  resources :users
  
  # Adicionando rota para requisitar a pagina de login
  get 'login', to: 'sessions#new'
  # Adicionando rota para efetuar login
  post 'login', to: 'sessions#create'
  # Adicionando rota para fazer logout
  delete 'logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
