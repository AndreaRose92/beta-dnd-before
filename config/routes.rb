Rails.application.routes.draw do
  resources :feats, only: [:index, :show]
  resources :equipment, only: [:index, :show]
  resources :race_skills, only: [:index, :show]
  resources :class_skills, only: [:index, :show]
  resources :char_skills, only: [:index, :show, :create, :destroy]
  resources :proficiencies, only: [:index, :show]
  resources :characters
  resources :races, only: [:index, :show]
  resources :dnd_classes, only: [:index, :show]
  # resources :users, only: [:update, :destroy]

  get '/me', to: "users#show"
  post '/signup', to: "users#create"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"
end
