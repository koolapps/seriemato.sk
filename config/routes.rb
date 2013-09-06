Seriemato::Application.routes.draw do
  namespace :admin do
    resources :issues, only: [:new, :create, :edit]
  end
end
