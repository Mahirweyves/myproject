require 'sidekiq/web'

Rails.application.routes.draw do


  
  resources :contacts, only: [:new, :create] 
  post "/trade/message" => "trades#email_trade", as: :email_trade
   get "trades/terms_and_conditions", :to => "trades#terms_and_conditions"
   get "trades/privacy_policy", :to => "trades#privacy_policy"
  resources :trades do
    resources :commons
    

  end

  get '/search' => 'trades#search', :as => 'search_trade' 

  
  devise_for :users
   get "users/trades/terms_and_conditions", :to => "trades#terms_and_conditions"
  root to: 'trades#index'
   
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    get '/users/destroy' => 'devise/registrations#destroy'
  end 
  resources :categories

end
