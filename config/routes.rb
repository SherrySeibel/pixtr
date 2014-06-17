Rails.application.routes.draw do
  root to:"galleries#index"
  resources :galleries, only: [:show, :new, :create, :edit, :update, :destroy] do
    resources :images, only: [:new, :create, :post, :edit, :update, :destroy,]


    # only nest resources once.
    # get "/images/new" => "images#new"
    # post "/images" => "images#create"
    # delete "/images/:id/delete" => "images#destroy"
  end
end
