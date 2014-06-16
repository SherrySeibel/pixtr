Rails.application.routes.draw do
 get "/" => "galleries#index"
 get "/galleries/:id" => "galleries#show"
end
