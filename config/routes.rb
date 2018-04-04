Rails.application.routes.draw do
  get 'home/index'
  root 'home#index'
  match '/results',   to: 'home#results',   via: 'get'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
