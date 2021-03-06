Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  devise_scope :user do
    get '/users/:id/social_link_confirmation' => 'users/registrations#social_link_confirmation', as: :social_link_confirmation
    patch '/users/:id/social_link_confirm' => 'users/registrations#social_link_confirm', as: :social_link_confirm
    get '/users/signup_finishing' => 'users/registrations#signup_finishing', as: :signup_finishing
    post '/users/signup_finish' => 'users/registrations#signup_finish', as: :signup_finish
  end

  root 'main#about'

  get '/about', to: 'main#about'

  resources :blogs, only: %i(index show)
  resources :products, only: %i(index show)

  namespace :admin do
    mount Ckeditor::Engine => '/ckeditor'

    get '/', to: 'overviews#index'
    resources :users, :blogs, :products, :reviews
    resources :about_sections, only: %i(edit update)
    namespace :acts_as_taggable_on do
      resources :tags, except: %i(new create)
    end
  end

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
