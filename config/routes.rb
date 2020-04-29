Rails.application.routes.draw do
  devise_for :users
  root to:'home#index'
  get 'home/about' => 'home#about'

  get  'index' =>'messages#index'
  post 'confirm' => 'messages#confirm'
  post 'done' => 'messages#done'

  resources :books, only: [:index, :create, :show, :edit, :update, :destroy]
  resources :users, only: [:index, :create, :show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
