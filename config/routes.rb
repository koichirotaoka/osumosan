Rails.application.routes.draw do
  root 'houses#index'
  
  devise_for :vendors, controllers: {
    sessions: 'vendors/sessions',
    passwords:'vendors/passwords',
    registrations: 'vendors/registrations'
  }
  resources :vendors
  get '/vendors/sign_out' => 'vendor/sessions#destroy'
  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
  resources :users
  get '/users/sign_out' => 'user/sessions#destroy'

  resources :houses
  resources :houses do
    collection do
      post :confirm
    end
  end
  resources :houses do
    post 'add' => 'favorites#create'
    delete '/add' => 'favorites#destroy'
  end
  get "/users/favorite/:id" => "users#favorite"
  resources :favorites, only: [:create, :destroy]
  
   ##### 問い合わせフォーム
  get 'contact' => 'contact#index' 
  get 'contact/confirm' => redirect("/contact")
  get 'contact/thanks' => redirect("/contact")
  ##### 問い合わせ確認画面
  post 'contact/confirm' => 'contact#confirm'
  ##### 問い合わせ完了画面
  post 'contact/thanks' => 'contact#thanks'
  
end
