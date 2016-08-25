Rails.application.routes.draw do 
  root 'users#index'
  get 'users/register'=> 'users#register'
  get 'users/login' => 'users#login'
  post 'users/create' => 'users#create'
  get 'users/:id' => 'users#show'
  post 'users/signIn' => 'users#signIn'
  post 'events/logout' =>'events#logout'
  get 'events/:id' => 'events#index'
  post 'events/create' => 'events#create'
  delete 'events/:id/destroy' => 'events#destroy'

end
