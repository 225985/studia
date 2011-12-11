Webapp::Application.routes.draw do
  scope :module => "db" do
    devise_for "db/users", :controllers => { :sessions => "sessions" }

    resources :users
    resources :projects do
      resources :milestones do
        resource :comments
        resource :attachments
      end
      resources :tasks do
        resource :comments
        resource :attachments
      end
      resource :comments
      resource :attachments
    end
  end

  root :to => "db/projects#index"
end
