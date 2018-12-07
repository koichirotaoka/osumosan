Rails.application.routes.draw do
  get 'tops/index'

  get 'sessions/new'

  root 'tops#index'
  resources :houses
  resources :houses do
    collection do
      post :confirm
    end
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  get "/users/favorites/:id" => "users#favorites"
  resources :venders
  resources :favorites, only: [:create, :destroy]
  resources :contacts
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
