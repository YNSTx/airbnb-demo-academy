Rails.application.routes.draw do
  resources :users, only: [:index]
  root to: "pages#home"

  resources :lectures, only: [:index, :show] do
    resources :reservations
  end
  resources :lectures, only: [:index, :show] do
    resources :reviews
  end
  devise_for :users
end
