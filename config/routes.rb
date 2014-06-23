Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
  root to: "galleries#index"
  resources :galleries, only: [:show, :new, :create, :edit, :update, :destroy] do
    resources :images, only: [:new, :create, :show, :destroy]

  end
  resources :images, only: [:edit, :update]
    # only nest resources once.
    # get "/images/new" => "images#new"
    # post "/images" => "images#create"
    # delete "/images/:id/delete" => "images#destroy"
end
