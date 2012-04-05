SampleApp::Application.routes.draw do
  root :to => "user_sessions#new"
  #  get "user_sessions/new"
  #  resources :user_sessions
  resources :home
  resources :profiles
  #  match 'login' => "user_sessions#new", :as => :login
  #
  #  match 'logout' => "user_sessions#destroy", :as => :logout
  #  match 'signup' => "users#new", :as => :signup
  #  resources :users
  #  match 'activate(/:activation_code)' => 'users#activate', :as => :activate_account
  #  match 'send_activation(/:user_id)' => 'users#send_activation', :as => :send_activation
  #
  ########################################
  resources :user_sessions
  resources :users

  match 'logout' => "user_sessions#destroy", :as => :logout
  match 'signup' => 'users#new', :as => :signup

  match 'register' => 'users#create', :as => :register

  match 'login' => 'user_sessions#new', :as => :login

  match 'logout' => 'user_sessions#destroy', :as => :logout

  match '/activate/:activation_code' => 'users#activate', :as => :activate, :activation_code => nil

  match '/forgot_password' => 'user_sessions#forgot_password', :as => :forgot_password
  
  match '/reset_password/:reset_code' => 'user_sessions#reset_password', :as => :reset_password

  ################################################

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
