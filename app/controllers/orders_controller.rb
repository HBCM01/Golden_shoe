class OrdersController < ApplicationController
  def new
    @order = Order.new
    @order.shoe = Order.find(params[shoe])
  end

  def create
    @order = Order.new(order_params)
    @order.user = current_user
    @shoe = Shoe.find(params[shoe])
    @order.shoe = @shoe
  end

  private

  def order_params
  end
end
