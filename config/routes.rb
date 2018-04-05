Rails.application.routes.draw do
  get 'home/index'
  root 'home#index'
  match '/results',   to: 'home#results',   via: 'get'
  match '/send_sms',   to: 'home#send_sms',   via: 'get'
  match '/receive_sms',   to: 'home#receive_sms',   via: 'post'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
