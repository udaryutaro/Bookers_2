Rails.application.routes.draw do

  devise_for :users
  resources :users, only: [ :index, :show, :edit, :update]
  #resources :tops
  resources :books, only: [ :index, :create, :show, :edit, :update, :destroy] do
  	resource :favorites, only: [:create, :destroy]
  	resources :book_comments, only: [:create, :destroy]
  end
  root to: 'home#index'
  get 'home/about' => 'home#about'
  post 'follow/:id' => 'relationships#follow', as:'follow'
  post 'unfollow/:id' => 'relationships#unfollow', as:'unfollow'
  get  'follower/:id' => 'relationships#follower',as:'follower'
  get  'followed/:id' => 'relationships#followed',as:'followed'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
