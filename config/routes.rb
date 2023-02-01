Rails.application.routes.draw do

  root to: "articles#index"
  resources :articles, only: [:index, :show]

  devise_for :companies, controllers: {
    registrations: 'companies/registrations',
    sessions: 'companies/sessions'
  }
  

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  namespace :admin do
    resources :articles, only: [:new, :create, :edit, :destroy]
  end
end
