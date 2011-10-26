Webapp::Application.routes.draw do
  namespace :db do
    resources :tasks
  end

  root :to => "db/tasks#index"
end
