Vcruit::Application.routes.draw do
  
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  
  get '/user/', to: 'users#show', as: '/user/'
  

  
  
  resources :static_pages
  resources :sessions
  resources :users
  
  root :to => 'static_pages#index'
  
  match '/about',  to: 'static_pages#about'
  match '/contact',  to: 'static_pages#contact'

end
