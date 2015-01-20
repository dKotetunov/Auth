Auth::Application.routes.draw do

get "log_out" => "sessions#destroy", :as => "log_out"
get "log_in" => "sessions#new", :as => "log_in"
get "sign_up" => "users#new", :as => "sign_up"

root :to => "users#new"

resources :users do
	resource :profile, except: [:new, :create]
  end

resources :sessions

scope :admin do
  get 'admin_log_out', to: 'admin_sessions#destroy'
  get 'admin_log_in', to: 'admin_sessions#new'
  get 'admin', to: 'admins#new'

  resources :admins do
    resource :profiles_admin, except: [:new, :create]
  end
  resources :admin_sessions
  end





end
