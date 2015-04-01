Rails.application.routes.draw do
  get 'signup' => 'users#new'
  root 'users#new'

  resources :users
end
