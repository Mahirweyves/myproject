require 'sidekiq/web'

Rails.application.routes.draw do
  resources :categories

  post "/trade/message" => "trades#email_trade", as: :email_trade
  resources :trades do
    resources :commons
    
  end



  get '/search' => 'trades#search', :as => 'search_trade' 
  devise_for :users
  root to: 'trades#index'
   
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    get '/users/destroy' => 'devise/users#destroy'
  end 
  resources :categories
end
