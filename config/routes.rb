Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/posts', to: 'posts#index'
      post 'posts/create'
      get '/posts/:id', to: 'posts#show'
      delete '/destroy/:id', to: 'posts#destroy'
    end
  end
  #get '/*path' => 'homepage#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'api/v1/posts#index'
end
