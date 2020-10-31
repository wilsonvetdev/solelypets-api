Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/animal_shelters', to: 'animal_shelters#index'

  post '/login', to: 'users#login'

end
