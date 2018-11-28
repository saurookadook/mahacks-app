Rails.application.routes.draw do
  resources :to_do_items

  root to: 'welcome#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
