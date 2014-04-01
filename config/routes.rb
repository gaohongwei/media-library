MediaLibrary::Engine.routes.draw do
  resources :uploads
  resources :galleries
  resources :items, as: :profiles

  resources :variations, only: [:create, :destroy]

  match "search" => "searches#search", as: :search
end
