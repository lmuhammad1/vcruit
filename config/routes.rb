Vcruit::Application.routes.draw do
  resources :static_pages
  
  match '/about',  to: 'static_pages#about'
  match '/contact',  to: 'static_pages#contact'


  root :to => 'static_pages#index'
end
