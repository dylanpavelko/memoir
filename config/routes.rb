Rails.application.routes.draw do
  resources :user_has_viewing_preferences

  resources :viewing_preferences

  resources :user_has_viewing_privileges

  resources :roles

  resources :viewing_privileges

  get 'sessions/login'
  post 'sessions/login'
  get 'sessions/home' => "pages#view"

  get 'sessions/profile'

  get 'sessions/setting'

  get 'users/new'

  resources :group_has_storylines

  resources :group_has_characters

  resources :eras

  resources :groups

  resources :detail_levels

  resources :storyline_tags

  resources :content_blocks

  resources :content_types

  resources :images

  resources :texts

  resources :titles

  resources :chunks

  resources :styles

  resources :character_tags

  resources :users
  #get 'welcome/index'

  resources :relationship_types

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  #root 'welcome#index'

  get "logout" => "sessions#logout"

  post ':controller(/:action(/:id))(.:format)'

  #root :to => "sessions#login"
  get "view_preferences" => "pages#viewPreferences"
  get "/pages/tools" => "pages#tools"
  get "/pages/view" => "pages#view"
  get "/pages/:page" => "pages#view"
  root "pages#view", pages: "view"



  
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
