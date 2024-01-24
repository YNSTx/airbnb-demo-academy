Rails.application.routes.draw do
  resources :users, only: [:index]
  root to: "pages#home"
  resources :reservations, only: [:index ]

  resources :lectures, only: [:index, :show] do
    resources :reservations, expect: [:index ]
  end
  resources :lectures, only: [:index, :show] do
    resources :reviews
  end
  devise_for :users
end
