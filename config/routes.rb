Rails.application.routes.draw do
  # devise_for :users, path: '', path_names: {
  #   sign_in: 'login',``
  #   sign_out: 'logout',
  #   registration: 'signup'
  # },
  # controllers: {
  #   sessions: 'users/sessions',
  #   registrations: 'user/registrations'
  # }
  
  namespace :api do
    namespace :v1 do
      get '/posts', to: 'posts#index'
      get 'posts/new', to: 'posts#new'
      post 'posts/create', to: 'posts#create'
      get '/posts/:id', to: 'posts#show'
      put '/posts/:id/edit', to: 'posts#update'
      delete '/posts/:id', to: 'posts#destroy'
    end
  end
  #get '/*path' => 'homepage#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
