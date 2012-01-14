App::Application.routes.draw do
  resources :accounts
  resources :transfers

  root :to => 'accounts#index'
end
