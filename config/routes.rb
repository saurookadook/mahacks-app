Rails.application.routes.draw do
  # resources :to_do_items
  resources :users do
    resources :to_do_items
  end

  resources :to_do_items

  get '/signup', to: 'users#new', as: 'new_user_registration'

  get '/login', to: 'sessions#new', as: 'new_user_session'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'destroy_user_session'

  root to: 'welcome#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
