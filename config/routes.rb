Rails.application.routes.draw do
  get 'homes/index'
  resources :kpposts
  devise_for :kpusers
  resources :kpcomments
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :kpusers, only: [:show, :edit, :update]
  # Defines the root path route ("/")
  #  root "homes#index"
   root "kpposts#index"
end
