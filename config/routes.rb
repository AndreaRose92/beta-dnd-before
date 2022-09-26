Rails.application.routes.draw do
  resources :char_spells
  resources :class_spells
  resources :spells
  resources :spell_levels
  resources :subraces
  resources :feats, only: [:index, :show]
  resources :equipment, only: [:index, :show]
  resources :race_skills, only: [:index, :show]
  resources :class_skills, only: [:index, :show]
  resources :char_skills, only: [:index, :show, :create, :destroy]
  resources :proficiencies, only: [:index, :show]
  resources :characters
  resources :races, only: [:index, :show]
  resources :dnd_classes, only: [:index, :show]

  get '/me', to: "users#show"
  get '/dnd_classes/:dnd_class/proficiencies', to: "dnd_classes#proficiencies"
  post '/signup', to: "users#create"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"
  get '/dnd_class_levels/:dnd_class', to: "dnd_class_levels#index"
  get '/dnd_class_levels/:dnd_class/:level_id', to: "dnd_class_levels#show"
end
