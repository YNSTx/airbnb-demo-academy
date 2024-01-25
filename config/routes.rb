Rails.application.routes.draw do
  resources :users, only: [:index]
  root to: "pages#home"
  resources :reservations, only: [:index, :destroy]

  resources :lectures, only: [:index, :show] do
    resources :reservations, except: [:index, :destroy]
  end
  resources :lectures, only: [:index, :show] do
    resources :reviews
  end
  devise_for :users
end
