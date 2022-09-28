Rails.application.routes.draw do
# data pulled from api
  resources :dnd_classes, only: [:index, :show]
  resources :races, only: [:index, :show]
  resources :subraces, only: [:index, :show]
  resources :spells, only: [:index, :show]
  resources :equipment, only: [:index, :show]
  resources :class_spells, only: [:index, :show]
  
# data referenced from api, suplemented locally
  resources :feats, only: [:index, :show]
  resources :spell_levels, only: [:index, :show]
  resources :race_skills, only: [:index, :show]
  resources :class_skills, only: [:index, :show]
  resources :proficiencies, only: [:index, :show]
  
# data created and updated by users
  resources :characters
  resources :char_spells, only: [:create, :destroy]
  resources :char_skills, only: [:create, :destroy]
  resources :character_builders, only: [:create, :update, :destroy]

# user session data 
  get "/me", to: "users#show"
  post "/signup", to: "users#create"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

# custom routes for more specific rendering
  get "/dnd_class_levels/:dnd_class", to: "dnd_class_levels#index"
  get "/dnd_classes/:dnd_class/proficiencies", to: "dnd_classes#proficiencies"
  get "/dnd_class_levels/:dnd_class/:level_id", to: "dnd_class_levels#show"
  get "/spells/damage/:spell_id", to: "spell_damages#show"
  get "/spells/:dnd_class", to: "spells#class_specific"
  get "/spells/:level", to: "spells#level_specific"
  get "/spells/:dnd_class/:level", to: "spells#class_level_specific"
  get "/features/:dnd_class", to: "features#index"
  get "/feature/:name", to: "features#show"
end
