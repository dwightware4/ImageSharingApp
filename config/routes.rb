Links::Application.routes.draw do
  root to: "sessions#new"

  resource :session, only: [:new, :create, :destroy]
  resources :users
  resources :links
  resources :comments, except: [:index, :show]

end
