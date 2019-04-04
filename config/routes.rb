Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :decks, only: [:create_deck]
      get '/decks/new', to: 'decks#create_deck'
    end
  end
end
