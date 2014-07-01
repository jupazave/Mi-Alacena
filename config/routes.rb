Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root 'productos#index'

  get 'template/productos' => 'handlebar_templates#productos'
  get 'template/modal' => 'handlebar_templates#modal'
  get 'template/sin-productos' => 'handlebar_templates#empty'

  get 'productos/estados' => 'productos#estados'
  post 'productos/listado' => 'productos#productos'

  get 'carrito' => 'carrito#index'
  get 'carrito/index' => 'carrito#index'
  get 'carrito/empty' => 'carrito#vaciar'
  post 'carrito/update' => 'carrito#actualizar'
  post 'carrito/delete' => 'carrito#borrar'
  post 'carrito/agregar' => 'carrito#agregar'
  get 'carrito/pago' => 'carrito#pago'
  post 'carrito/pagado' => 'carrito#pagado'
  

  
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
