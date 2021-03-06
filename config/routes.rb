Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post '/user_login', to: 'users#login'
  post '/register', to: 'users#create'
  get '/keep_logged_in', to: 'users#keep_logged_in'
  
  get '/animal_shelters', to: 'animal_shelters#index'
  patch '/animal_shelters/update', to: 'animal_shelters#update'
  post '/shelter_login', to: 'animal_shelters#login'
  post '/shelter_register', to: 'animal_shelters#create'

  post '/animals', to: 'animals#create'
  patch '/animals/:id', to: 'animals#update'
  delete '/animals/:id', to: 'animals#destroy'

  post '/create-checkout-session', to: 'charges#create'

  post '/items_upload', to: 'items#create'

end
