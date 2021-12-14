Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :warehouses, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :cars, only: [:new, :create]

  end
  resources :cars, only: [:index, :show, :edit, :update, :destroy, :book]

  post 'cars/:id/book', to: 'cars#book', as: 'book'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
