Rails.application.routes.draw do
  get 'relationships/create'
  get 'relationships/destroy'
  get 'users/show'
  root to: 'articles#index'

  resources :articles

  get "home", to: "article#index"
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  resources :users

  resources :favorites, only: %i(create destroy)

  resources :relationships, only: %i(create destroy)
end
