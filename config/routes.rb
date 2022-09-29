Rails.application.routes.draw do
# data created and updated by users
  resources :characters
  resources :character_builders, only: [:create, :update]

# user session data 
  get "/me", to: "users#show"
  post "/signup", to: "users#create"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  delete "/character_builders", to: "character_builders#destroy"
  patch "/characters/:id/health", to: "characters#health"


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
  get "/races", to: "races#index"
  get "/races/:race", to: "races#show"
  post "/races/:race", to: "races#create"
  get "/races/:race/:subrace", to: "subraces#show"
  post "/races/:race/:subrace", to: "subraces#create"
  get "/dnd_classes", to: "dnd_classes#index"
  get "/dnd_classes/:dnd_class", to: "dnd_classes#show"
  post "/dnd_classes/:dnd_class/:level", to: "dnd_classes#create"
  
end
