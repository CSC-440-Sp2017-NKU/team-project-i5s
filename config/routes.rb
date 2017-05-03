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
  
  get 'Question/Edit/:id', to: 'qa#edit_question'
  post 'Question/Edit/:id', to: 'qa#edit_question'
  delete 'Question/Delete', to: 'qa#delete_question'
  
  get 'Answer/Edit/:id', to: 'qa#edit_answer'
  post 'Answer/Edit/:id', to: 'qa#edit_answer'
  delete 'Answer/Delete', to: 'qa#delete_answer'
  
  
  get 'users/view/:id', to: 'users#view'
  get 'Registrar', to: 'users#registrar_form'
  post 'Registrar', to: 'users#handle_upload'
  
  #
  get 'Users', to: 'users#list'
  
  #/:answer_id/:direction
  post 'vote', to: 'qa#vote', as: :vote
  
  #class controller
  get 'Courses', to: 'course#list_course'
  get 'Course/:id', to: 'course#view_course'
  get 'Section/:id', to: 'course#view_section'
  
  
  #application controller!
  get 'Search', to: 'application#search_form'
  post 'Search', to: 'application#search_result', as: :search_result
  
  #user files
  post 'UploadUserFile', to: 'user#upload_user_file', as: :upload_user_file
  delete 'DeleteUserFile', to: 'user#delete_user_file'
  get 'Download/:id', to:'user#download_file', as: :item_download
  
  #authlogic
  resources :user_sessions

  match 'login' => "user_sessions#new",      :as => :login, via: [:get, :post]
  match 'logout' => "user_sessions#destroy", :as => :logout, via: [:get, :post]

  get 'splash', to: 'user_sessions#splash', as: :splash

  resources :users  # give us our some normal resource routes for users
  resource :user, :as => 'account'  # a convenience route

  match 'signup' => 'users#new', :as => :signup, via: [:get, :post]

  root :to => 'users#new'
end
