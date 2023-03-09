Rails.application.routes.draw do
  
  namespace :api do
    namespace :v1 do
      
        get '/posts', to: 'posts#index'
        get '/posts/:id', to: 'posts#show'
        post '/posts/create', to: 'posts#create'
        put '/posts/:id/edit', to: 'posts#update'
        delete '/posts/:id', to: 'posts#destroy'

        get '/posts/:post_id/comments', to: 'comments#index'
        get '/posts/:post_id/comments/:id', to: 'comments#show'
        post '/posts/:post_id/comments/create', to: 'comments#create'
        put '/posts/:post_id/comments/:id/edit', to: 'comments#update'
        delete '/posts/:post_id/comments/:id', to: 'comments#destroy'

    end
  end

  #get '/*path' => 'homepage#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
