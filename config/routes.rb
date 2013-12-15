TimesheetManagement::Application.routes.draw do
  get "project/index"
  get "project/edit"
  get "project/new"
  get "clients/index"
  get "clients/new"
  get "clients/edit"
  get "daily_sheet/index"
  get "daily_sheet/new"
  get "daily_sheet/edit"
  get "audit/index"
  get "departments/index"
  get "departments/new"
  get "departments/edit"
  get "divisions/index"
  get "divisions/new"
  get "divisions/edit"
  get "users/index"
  get "users/new"
  get "users/edit"
  get "dashboard/index"
  
  post "/dashboard/:id/reject", to: 'dashboard#reject'
  devise_for :users
  
  resources :dashboard do
     post 'submit'
     post 'reopen'
     post 'accept'
     post 'reject'
  end
  
  namespace :admin do
    resources :users
    resources :divisions
    resources :departments
    resources :audit, :only => [:index] do
       collection do
	 post 'set_level'
       end
    end
  end
  
  resources :clients
  resources :projects
  
  resources :admin, :only => [:index]
  resources :daily_sheet
  root 'dashboard#index'
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
