Rails.application.routes.draw do

  post 'user_token' => 'user_token#create'

  root 'product_categories#index'

  get '/api_request', action: 'api_request', controller: 'product_categories'

  resources :product_categories, only: [:show]
end


=begin


curl -I localhost:3000/api_request

curl -H "Content-Type: application/json" -X POST -d '{"auth":{"email":"admin@mail.com","password":"securepassword"}}' http://localhost:3000/user_token


curl -i http://localhost:3000/api_request -H "Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1MTcwNTU5NjIsInN1YiI6MX0.N1mLC9Dc0H485IZ0wfQ3RVmiiT_NGaS1Rn4_ahU49kA"

=end