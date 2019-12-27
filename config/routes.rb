Rails.application.routes.draw do
  devise_for :users
  root to: "top#index"
  resources :posts do
    resources :comments, only:[:create]
  end
  
  resources :users
  resources :mypage, only:[:show]

  resources :searches,only:[:index]
  resources :top,only:[:index]
end
