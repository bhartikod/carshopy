Rails.application.routes.draw do
  get 'likes/index'
  devise_for :users
  
  devise_scope :user do  
   get '/users/sign_out' => 'devise/sessions#destroy'     
  end
  
  get 'homes/index'
  
  root'homes#index'
  resources :profiles
  resources :cars do
    resources :reviews
    resources :likes, only: [:create]
      
  end
    
  #resources :likes
  

resources :sellcars
resources :enquiries
resources :ratings
end
