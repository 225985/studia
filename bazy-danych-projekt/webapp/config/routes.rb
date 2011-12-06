Webapp::Application.routes.draw do
  scope :module => "db" do
    devise_for "db/users", :controllers => { :sessions => "sessions" }

    resources :users
    resources :projects do
      resources :milestones do
        resource :comments
      end
      resources :tasks do
        resource :comments
      end
      resource :comments
    end
  end

  root :to => "db/projects#index"
end
