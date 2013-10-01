Seriemato::Application.routes.draw do
  root to: 'index_pages#show'
  get '/admin', to: 'admin/issues#index'

  namespace :admin do
    resources :categories, only: [:new, :create, :edit, :update, :index, :destroy]
    resources :issues, only: [:new, :create, :edit, :index, :update]
  end

  resources :issues, only: [:show, :index] do
    resources :smts, only: [:new, :create]
    resources :solvers, only: [:new, :create]
  end

  resources :categories, only: [:show]
  resources :smts, only: [:update]
end
