Rails.application.routes.draw do

    resources :characters
    resources :dnd_classes, only: [:index]
    resources :races, only: [:index]
    resources :equipment, only: [:index]

    get "/me", to: "users#show"
    post "/singup", to: "users#create"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    patch "/characters/:id/health", to: "characters#health"
    post "/characters/:id/finalize", to: "characters#finalize_new_character"
    get "/races/:race", to: "races#show"
    post "/races/:race", to: "races#create"
    get "/dnd_classes/:dnd_class", to: "dnd_classes#show"
    post "/dnd_classes/:dnd_class", to: "dnd_classes#create"
    get "/equipment/:item", to: "equipment#show"
    post "/equipment/:item", to: "equipment#create"

end