Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :order_items
  resources :inventories
  resources :costs
  resources :suppliers
  resources :orders
  resources :order_statuses
  resources :supplies
  resource :cart, only: [:show]
  devise_for :users

  get "/inventory" => "pages#inventory"
  get "/staff" => "pages#emps"
  get "/test" => "pages#testpage"
  get "/order" => "pages#order"
  root 'welcome#index'
  post 'inventory/orders'
  post '/cart' => "orders#placeorder"

end
