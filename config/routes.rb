Rails.application.routes.draw do
  resources :artists do
    resources :songs, only: [:new, :create, :index]
  end
  resources :songs, only: [:show, :edit, :update, :index, :destroy]
  resources :playlists

  get '/auth/spotify/callback', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'
end
