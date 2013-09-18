Seriemato::Application.routes.draw do
  root to: 'index_pages#index'
  namespace :admin do
    resources :issues, only: [:new, :create, :edit, :index, :update]
    resources :categories, only: [:new, :create, :edit, :update, :index, :destroy]
  end
  resources :issues, only: [:show] do
    resources :smts, only: [:create]
  end
  resources :smts, only: [:update]
  resources :category, only: [:show]
  get '/admin', to: 'admin/issues#index'
end
