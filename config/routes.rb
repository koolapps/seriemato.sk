Seriemato::Application.routes.draw do
  root to: 'index_pages#index'
  namespace :admin do
    resources :issues, only: [:new, :create, :edit, :index, :update]
  end
end
