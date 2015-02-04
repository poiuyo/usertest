Rails.application.routes.draw do
  
  get 'display_products/index'

  resource :cart, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]
  resources :products do
   
     get "delete"
  end
  
  resources :tests
  
  get 'sessions/new'

  resources :users 
  
  root to: "display_products#index"  
 
  post 'sessions/create' => 'sessions#create'
  
    match 'register'=> 'users#new', :via=> [:get], :as => :register
   #match 'login' => 'sessions#new', :via=> [:get], :as => :login
   match 'logout' => 'sessions#destroy', :via=> [:get], :as => :logout
   match 'login' => 'sessions#new', :via=>[:get], :as => :login
   match 'iamtheadministrator' => 'users', :via=>[:get], :as => :admin
   match 'index' => 'tests#index', :via=>[:get], :as => :administrator
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
