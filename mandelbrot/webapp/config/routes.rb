Mandelbrot::Application.routes.draw do

  root                            :to => "pages#home"
  get "/about",                   :to => "pages#about"

  post "/update",                 :to => "users#update"

  get "/auth/:provider/callback", :to => "sessions#create"
  get "/auth/failure",            :to => "sessions#failure"
  get "/signout",                 :to => "sessions#destroy"

end
