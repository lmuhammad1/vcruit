Vcruit::Application.routes.draw do

  resources :posts


  root :to => 'static_pages#index'

  resources :users
  resources :static_pages
  resources :sessions

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  get '/user/', to: 'users#show', as: '/user/'

  get 'welcome', to: 'users#welcome'

  match '/about',  to: 'static_pages#about'
  match '/contact',  to: 'static_pages#contact'
end
