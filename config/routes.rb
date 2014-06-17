Rails.application.routes.draw do
  root to:"galleries#index"
  resources :galleries, only: [:show, :new, :create, :edit, :update, :destroy] do
    get "/images/new" => "images#new"
    post "/images" => "images#create"
  end
end
