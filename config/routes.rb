Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :posts, only: [:new, :create, :index, :destroy]

  root 'posts#index'
end
