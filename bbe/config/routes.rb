Rails.application.routes.draw do

  resources :home
  
  resources :homework_payments

  resources :homeworks

  resources :paths

  resources :achievements

  resources :sections

  resources :courses do
    collection do
      get 'in_progress'
      get 'join_enrollment'
    end
  end

  resources :categories
  
  resources :enrollment

  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks", :registrations => "registrations" }

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'

  get '/backend/courses', to: 'backend#courses', as: 'backend_courses'
  get '/backend/balance', to: 'backend#balance', as: 'backend_balance'
  get '/backend/checked_assignments', to: 'backend#checked_assignments', as: 'backend_checked_assignments'
  get '/backend/pending_assignments', to: 'backend#pending_assignments', as: 'backend_pending_assignments'

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
