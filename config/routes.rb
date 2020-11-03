Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/animal_shelters', to: 'animal_shelters#index'
  
  post '/user_login', to: 'users#login'
  post '/shelter_login', to: 'animal_shelters#login'
  post '/register', to: 'users#create'
  get '/keep_logged_in', to: 'users#keep_logged_in'
  post '/create-checkout-session', to: 'charges#create'

end
