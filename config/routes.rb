Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
  root to: "galleries#index"

  resources :groups, only: [:new, :create, :index, :show] do
    resource :group_membership, only: [:create, :destroy]
  end

  resources :galleries, only: [:show, :new, :create, :edit, :update, :destroy] do
    resources :images, only: [:new, :create, :destroy]
  end

  resources :images, only: [:edit, :update, :show] do
    resources :comments, only: [:create]
    resources :group_images, only: [:create]
    resource :like, only: [:create]
  end
    # only nest resources once.
    # get "/images/new" => "images#new"
    # post "/images" => "images#create"
    # delete "/images/:id/delete" => "images#destroy"
end
