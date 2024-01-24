Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :users, only: [:index]
  resources :sessions, only: [:index, :show] do
    resources :reservations
  end
  resources :sessions, only: [:index, :show] do
    resources :reviews
  end
end
