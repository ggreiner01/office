class CartsController < ApplicationController
  def show
    @order_items = current_order.order_items
  end
  def new
  end

  def create
    @order = current_order
    @order_item = @order.order_items.new(order_item_params)
    @order.save
    session[:order_id] = @order.id
  end

end
