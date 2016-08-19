Rails.application.routes.draw do 
  get 'calendars/index'

  root 'users#index'
  get 'users/register'=> 'users#register'
  get 'users/login' => 'users#login'
  post 'users/create' => 'users#create'
  get 'users/:id' => 'users#show'
  post 'users/signIn' => 'users#signIn'
  get 'calendars/:id' =>'calendars#index'
  post 'calendars/logout' =>'calendars#logout'
end
