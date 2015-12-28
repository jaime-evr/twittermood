Rails.application.routes.draw do
  post '/auth/:provider/callback', to: 'sessions#create'
  root 'home#index'
end
