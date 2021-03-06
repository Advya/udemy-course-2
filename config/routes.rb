Rails.application.routes.draw do
  resources :users
  resources :articles
  get 'pages/home'
  get 'pages/about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#home'
  get 'about', to: 'pages#about'
  get 'signup' => 'authors#new'
  resources :authors, except: [:new]
  resources :categories, except: [:destroy]

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'


end
