Rails.application.routes.draw do
  #resources :game_plays
  resources :game_plays, only: [:create, :index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
