Prosjektside::Application.routes.draw do
  root :to => 'home#index'
  
  resources :home
  resources :members
  resources :admin
  resources :documents
  resources :sessions
  resources :users
  
  get "protocol/index"
  get "home/index"
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "users/new"
  
  match '/homedocs' => 'home#documents'
  match '/about_admin' => 'admin#about'
  match '/protocol' => 'protocol#index', :as => :protocol
  match '/protocol/:url' => 'protocol#index', :constraints => {:url => /.*/}
  match '/admin' => 'admin#index', :as => :admin_path
end
