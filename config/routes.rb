Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  get 'products/search'
  
  resources :items do
    resources :orders , only: [:index, :create] 
  end
end
