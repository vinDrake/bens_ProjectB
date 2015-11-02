Rails.application.routes.draw do
  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  get 'questions/new'

  get 'questions/create'

  get 'questions/index'

  get 'questions/show'

  get 'questions/edit'

  get 'questions/update'

  get 'players/new'

  get 'players/create'

  get 'players/index'

  get 'players/show'

  get 'players/edit'

  get 'players/update'

  get 'tickets/new'

  get 'tickets/create'

  get 'tickets/index'

  get 'tickets/show'

  get 'challenges/new'

  get 'challenges/create'

  get 'challenges/index'

  get 'challenges/show'

  get 'answers/new'

  get 'answers/create'

  get 'answers/index'

  get 'answers/show'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  get 'signup' => 'players#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products
  resources :players
  resources :questions do
    resources :answers
  end
  resources :answers
  resources :challenges do
    resources :tickets
  end
  resources :tickets
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
