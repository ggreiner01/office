Rails.application.routes.draw do
  resources :inventories
  resources :costs
  get "/oh" => "pages#order_page"
  get "/staff" => "pages#emps"
  get "/test" => "pages#testpage"

  resources :suppliers
  resources :orders
  resources :order_statuses
  resources :supplies
  devise_for :users
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
