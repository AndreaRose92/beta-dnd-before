Rails.application.routes.draw do
# data pulled from api
  resources :dnd_classes, only: [:index, :show]
  resources :races, only: [:index, :show]
  resources :subraces, only: [:index, :show]
  resources :spells, only: [:index, :show]
  resources :equipment, only: [:index, :show]
  
# data referenced from api, suplemented locally
  resources :feats, only: [:index, :show]
  resources :race_skills, only: [:index, :show]
  resources :class_skills, only: [:index, :show]
  resources :proficiencies, only: [:index, :show]
  
# data created and updated by users
  resources :characters
  resources :char_spells, only: [:create, :destroy]
  resources :char_skills, only: [:create, :destroy]
  resources :character_builders, only: [:create, :update]

# user session data 
  get "/me", to: "users#show"
  post "/signup", to: "users#create"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"


# data from custom information in the database, not specifically from the api
  get "/spell_levels/:dnd_class", to: "spell_levels#index"
  get "/spell_levels/:dnd_class/:level", to: "spell_levels#show"
  post "/spell_levels/:dnd_class/:level", to: "spell_levels#create"
  get "/dnd_classes/:dnd_class/proficiencies", to: "dnd_classes#proficiencies"

# fetching specific data from api
  get "/spells/damage/:spell", to: "spell_damages#show"
  post "/spells/damage/:spell", to: "spell_damages#create"
  post "/spells/:spell", to: "spells#create"
  get "/spells/:level", to: "spells#level_specific"
  get "/spells/:dnd_class/list", to: "class_spells#class_index"
  get "/spells/:dnd_class/:level", to: "class_spells#level_index"
  post "/spells/:dnd_class/:spell", to: "class_spells#create"


# custom routes for more specific rendering
  get "/dnd_class_levels/:dnd_class", to: "dnd_class_levels#index"
  get "/dnd_class_levels/:dnd_class/:level_id", to: "dnd_class_levels#show"
  get "/features/:dnd_class", to: "features#index"
  get "/feature/:name", to: "features#show"
  patch "/characters/:id/health", to: "characters#health"
  delete "/character_builders", to: "character_builders#destroy"
  post "/equipment/:id", to: "equipment#create"
end
