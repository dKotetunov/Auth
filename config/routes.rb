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
  get 'admin_log_out', to: 'sessions#destroy'
  get 'admin_log_in', to: 'sessions#new'
  get 'admin/sign_up', to: 'admins#new'
  resources :admins
  end

end
