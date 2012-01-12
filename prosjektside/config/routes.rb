Prosjektside::Application.routes.draw do
  root :to => 'home#index'
  
  get "protocol/index"
  get "home/index"
  get "admin/index"
  resources :home
  resources :members
  resources :admin
  
  match '/documents' => 'home#documents', :as => :documents
  match '/about_admin' => 'admin#about'
  
  match '/protocol' => 'protocol#index', :as => :protocol
  match '/protocol/:url' => 'protocol#index', :constraints => {:url => /.*/}
  
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  resources :sessions
end