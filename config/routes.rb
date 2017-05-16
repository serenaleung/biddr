Rails.application.routes.draw do

  root 'auctions#index'

  resources :users, only: [:new, :create, :show] do
    resources :watches, only: [:index]
  end

  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end

  # resources :items, only: [:new, :create, :index, :show]

  post '/auctions/:id/publish' => 'auctions#publish', as: :publish

  resources :auctions, only: [:new, :create, :index, :show] do
    resources :bids, only: [:new, :create, :index]
    resources :watches, only: [:create, :destroy]
    resources :publishings, only: :create
  end


end
