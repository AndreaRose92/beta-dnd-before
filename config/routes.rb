Rails.application.routes.draw do
  resources :feats
  resources :equipment
  resources :race_skills
  resources :class_skills
  resources :char_skills
  resources :proficiencies
  resources :characters
  resources :races
  resources :dnd_classes
  resources :users

  get '/me', to: "users#show"
  post '/signup', to: "users#create"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"
end
