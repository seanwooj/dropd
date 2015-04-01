Rails.application.routes.draw do
  get 'sessions/new'

  get 'signup' => 'users#new'
  root 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  get 'welcome' => 'welcome#index'

  resources :users do
    resources :orders, :controller => 'users/orders'
  end
  resources :orders, :only => [:index, :show, :update] do
    member do
      put :update_status
    end
  end
end
