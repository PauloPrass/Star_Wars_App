Rails.application.routes.draw do
  get '/' => 'home#index', :as => 'home'
  get '/:id' => 'home#show', :as => 'show'
  resources :people
  resources :planets
  resources :species
  resources :starships
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
