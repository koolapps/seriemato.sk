Seriemato::Application.routes.draw do
  namespace :admin do
    resources :issues, only: [:new, :create, :edit, :index, :update]
  end
end
