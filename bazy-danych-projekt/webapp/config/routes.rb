Webapp::Application.routes.draw do
  scope :module => "db" do
    resources :tasks
  end

  root :to => "db/tasks#index"
end
