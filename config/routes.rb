Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "pages#home"
  get '/main', to: 'pages#main', as: :pages
  get '/signup', to: 'users#new'
  resources :accounts
  resources :branches
  resources :salesmen
  resources :users, except: [:new]
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
