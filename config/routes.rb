Rails.application.routes.draw do
  get 'users/new'
  root 'users#new'
end
