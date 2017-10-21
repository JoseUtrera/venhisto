Vendedores::Application.routes.draw do


  # about 
  
  get 'about/index'
  match 'about' => 'about#index'
  
  # Author
  
  match 'admin/author'          => 'admin/author#index'
  match 'admin/author/show/:id' => 'admin/author#show'
  match 'admin/author/edit/:id' => 'admin/author#edit'
  get  'admin/author/new'
  post 'admin/author/create'
  get  'admin/author/show'
  get  'admin/author/index'
  get  'admin/author/edit'
  post 'admin/author/update'
  post 'admin/author/destroy'
  
  # Publisher
  
  match 'admin/publisher'          => 'admin/publisher#index'
  match 'admin/publisher/show/:id' => 'admin/publisher#show'
  match 'admin/publisher/edit/:id' => 'admin/publisher#edit'
  get   'admin/publisher/index'
  get   'admin/publisher/new'
  post  'admin/publisher/create'
  get   'admin/publisher/edit'
  post  'admin/publisher/update'
  post  'admin/publisher/destroy'
  get   'admin/publisher/show'
 
  # Book

  match 'admin/book'          => 'admin/book#index'
  match 'admin/book/show/:id' => 'admin/book#show'
  match 'admin/book/edit/:id' => 'admin/book#edit'
  
  get  'admin/book/new'
  post 'admin/book/create'
  get  'admin/book/edit'
  post 'admin/book/update'
  post 'admin/book/destroy'
  get  'admin/book/show'
  get  'admin/book/index'

  # Catalog
  
  root :to => 'catalog#index'
  match 'catalog' => 'catalog#index'
  match 'catalog/show/:id' => 'catalog#show'
  
  get 'catalog/show'
  get 'catalog/index'
  get 'catalog/latest'
  get 'catalog/search'
  get 'catalog/rss'

  # Cart
  
  get  'cart/add'
  post 'cart/add'
  get  'cart/remove'
  post 'cart/remove'
  get  'cart/clear'
  post 'cart/clear'  
  
  # Checkout
  
  match 'checkout' => 'checkout#index'
  get   "checkout/index"
  post  "checkout/submit_order"
  get   "checkout/submit_order"
  get   "checkout/thank_you"

  # Order

  match 'admin/order' => 'admin/order#index'
  match 'admin/order/show/:id' => 'admin/order#show'

  get 'admin/order/index'
  get 'admin/order/show'
  
  post 'admin/order/close'
  post 'admin/order/destroy'
  
  
  
  # User_session
 
  get 'user_session/new'
  get 'user_sessions/create' # Para mostrar el login error tras reinicio del web server
  post 'user_session/create'
  get 'user_session/destroy'
  
  
  
  # User
  
  get 'user/new'
  post 'user/create'
  get 'user/show'
  match 'user/show/:id' => 'user#show'
  get 'user/edit'
  post 'user/update'
  
  # Forum
   
  match 'forum' => 'forum#index'
  match 'forum/show/:id' => 'forum#show'
  get 'forum/post'
  post 'forum/create'
  get 'forum/reply'
  get 'forum/destroy' # route for redirecting back
  post 'forum/destroy'
  get 'forum/show'
  get 'forum/index'


  # Tag - Palabras clave

  match 'admin/tag' => 'admin/tag#index'
  get 'admin/tag/new'
  post 'admin/tag/create'
  get 'admin/tag/edit'
  post 'admin/tag/update'
  post 'admin/tag/destroy'
  get 'admin/tag/show'
  match 'admin/tag/show/:id' => 'admin/tag#show'
  get 'admin/tag/index'

  
  # Forgot Password - resteo de contraseña
  get 'password_reset/new'
  post 'password_reset/create'
  get 'password_reset/edit'
  post 'password_reset/update'
  
  
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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
