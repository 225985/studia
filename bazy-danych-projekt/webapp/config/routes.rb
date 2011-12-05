Webapp::Application.routes.draw do
  scope :module => "db" do
    devise_for "db/users", :controllers => { :sessions => "sessions" }

    resources :users
    resources :projects do
      resources :milestones
      resources :tasks
    end
  end

  root :to => "db/projects#index"
end
