Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  get "/customers", to: "customers#index"
  get "/customers/new", to: "customers#new"
  get "/customers/:id", to: "customers#show"
  post "/customers", to: "customers#create"
  get "/customers/:id/edit", to: "customers#edit"
  patch "/customers/:id", to: "customers#update", as: :customer
  delete "/customers/:id", to: "customers#destroy"

  get "/orders", to: "orders#index"
  get "/orders/:id", to: "orders#show"
  get "/orders/:id/edit", to: "orders#edit"
  patch "/orders/:id", to: "orders#update", as: :order
  delete "/orders/:id", to: "orders#destroy"

  get "/customers/:id/orders", to: "customer_orders#index"
  get "/customers/:id/orders/new", to: "customer_orders#new"
  post "/customers/:id/orders", to: "customer_orders#create", as: :customer_orders

end
