Rails.application.routes.draw do
  devise_for :users
  
  resources :tweets do 
    resources :retweets, only: [:new, :create, :destroy]
	resources :comments, only: [:new, :create, :destroy]
	resources :re_comments, only: [:new, :create, :destroy]
	
	resources :likes, only: [:create, :destroy]
	resources :re_likes, only: [:create, :destroy]
	
	resources :follows, only: [:create, :destroy]
  end
  
  resources :tweet_pages, only: [:index, :destroy, :show ]
  resources :tweet_page_replies, only: [:index]
  resources :following_pages, only: [:index, :show]
  resources :followers_pages, only: [:index, :show] 
  
  
  devise_scope :user do
	root :to => 'devise/sessions#new'
  end

	
  # post '/tweets/:tweet_id/likes/:id/toggle' => 'likes#toggle'
  
  # root 'tweets#index'

  # Example of regular route:
  # get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  # get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

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
