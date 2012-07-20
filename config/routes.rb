PhotoShoot::Application.routes.draw do
  get 'home/index'
  root :to => 'home#index'
  
  devise_for :users
  resources :profiles

end
