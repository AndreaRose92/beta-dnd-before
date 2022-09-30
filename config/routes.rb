Rails.application.routes.draw do

    resources :characters
    resources :dnd_classes, only: [:index, :show]
    resources :races, only: [:index, :show]
    resources :equipment, only: [:index, :show]

    get "/me", to: "users#show"
    post "/singup", to: "users#create"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    patch "/characters/:id/health", to: "characters#health"
    post "/characters/:id/finalize", to: "characters#finalize_new_character"

end