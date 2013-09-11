Seriemato::Application.routes.draw do
  root to: 'index_pages#index'
  namespace :admin do
    resources :issues, only: [:new, :create, :edit, :index, :update]
    resources :categories, only: [:new, :index]
  end
  resources :issues, only: [:show]
  resources :category, only: [:show]
  get '/admin', to: 'admin/issues#index'
end
