Webapp::Application.routes.draw do
  scope :module => "db" do
    resources :projects do
      resources :milestones
      resources :tasks
    end
  end

  root :to => "db/projects#index"
end
