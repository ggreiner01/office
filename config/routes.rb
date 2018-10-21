Rails.application.routes.draw do
  resources :inventories
  resources :costs
  resources :suppliers
  resources :orders
  resources :order_statuses
  resources :supplies
  devise_for :users

  get "/inventory" => "pages#inventory"
  get "/staff" => "pages#emps"
  get "/test" => "pages#testpage"
  get "/order" => "pages#order"
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
