Rails.application.routes.draw do
  root to:'home#index'
  get 'home/about' => 'home#about'

  devise_for :users
  resources :books, only: [:index, :create, :show, :edit, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
