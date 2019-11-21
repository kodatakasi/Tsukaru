Rails.application.routes.draw do
  root to: 'articles#index'

  resources :articles do
    resources :comments, only: %i(create destroy)
    collection do
      get 'search'
    end
  end

  get "home", to: "article#index"
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  resources :users

  resources :favorites, only: %i(create destroy)

  resources :relationships, only: %i(create destroy)
end
