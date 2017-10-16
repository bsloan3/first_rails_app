Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: redirect('/posts')
  get '/posts', to: 'posts#index'
  get '/posts/:id', to: 'posts#show'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#delete'
end
