Rails.application.routes.draw do

  # get 'resumes/index'

  # get 'resumes/new'

  # get 'resumes/create'

  # get 'resumes/destroy'

  devise_for :users
  get 'home/index'
  resources :comments
  resources :posts do #nested routes for individual resumes/ files
  	resources :resumes	
  end
  root :to => "home#index"

  # resources :resumes, only: [:index, :new, :create, :destroy]
  
end


