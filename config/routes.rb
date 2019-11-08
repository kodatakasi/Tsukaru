Rails.application.routes.draw do
  root to: 'articles#index'
  resources :articles
  get "home", to: "article#index"

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
end
