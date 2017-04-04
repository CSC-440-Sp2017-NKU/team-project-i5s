Rails.application.routes.draw do
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
  
  root 'forum#index'
  get '/Forums', to: 'forum#list_forums'
  get '/Forums/:id', to: 'forum#view_forum'
  get '/Question/:id', to: 'qa#view_question'
  get '/Question/Post/:forum_id', to: 'qa#post_question'
  post '/Question/Post', to: 'qa#post_question'
  get '/Question/Answer/:question_id', to: 'qa#answer_question'
  post '/Question/Answer', to: 'qa#answer_question'
  
  get 'forum/index'
  get 'forum/view_forum'
  get 'qa/answer_question'
  get 'qa/post_question'
  get 'qa/view_question'
  get 'forum/list_forums'
  
  get 'Question/Edit/:id', to: 'qa#edit_question'
  post 'Question/Edit', to: 'qa#edit_question'
  post 'Question/Delete', to: 'qa#delete_question'
  
  get 'Answer/Edit/:id', to: 'qa#edit_answer'
  post 'Answer/Edit', to: 'qa#edit_answer'
  post 'Answer/Delete', to: 'qa#delete_answer'
  
  get 'users/:id', to: 'users#view'
  
  post 'vote/:answer_id/:direction', to: 'qa#vote'
  
  #authlogic
  resources :user_sessions

  match 'login' => "user_sessions#new",      :as => :login, via: [:get, :post]
  match 'logout' => "user_sessions#destroy", :as => :logout, via: [:get, :post]

  resources :users  # give us our some normal resource routes for users
  resource :user, :as => 'account'  # a convenience route

  match 'signup' => 'users#new', :as => :signup, via: [:get, :post]

  root :to => 'users#new'
end
