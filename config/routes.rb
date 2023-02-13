Rails.application.routes.draw do

  root to: "articles#index"
  resources :articles, only: [:index, :show]
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development? || Rails.env.production?
  resources :jobs do
    resources :offers, only: [:new, :create]
  end

  devise_for :companies, controllers: {
    registrations: 'companies/registrations',
    sessions: 'companies/sessions',
  }
  

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
  }

  namespace :admin do
    resources :articles, only: [:new, :create, :edit, :update, :destroy]
  end
end
