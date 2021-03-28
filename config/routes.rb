Rails.application.routes.draw do
  get 'cards/new'
  get 'users/show'
  devise_for :users
  root to: "items#index"
  get 'items/search'
  
  resources :items do
    resources :orders , only: [:index, :create]
  end

  resources :users, only: :show
  resources :cards, only: [:new, :create]
end
