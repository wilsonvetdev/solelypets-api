Rails.application.routes.draw do
  resources :donations
  resources :comments
  resources :animal_shelters
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
