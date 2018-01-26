Rails.application.routes.draw do

  post 'user_token' => 'user_token#create'

  root 'product_categories#index'

  get '/api_request', action: 'api_request', controller: 'product_categories'

  resources :product_categories, only: [:show]
end
