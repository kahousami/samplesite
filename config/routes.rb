Rails.application.routes.draw do

  get 'home/top'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#top'
  resources :posts do
  	resources :post_comments, only: [:create, :destroy]
  end
  resources :categories, only: [:index, :show]

  get '/search', to: 'posts#search'
  
end
