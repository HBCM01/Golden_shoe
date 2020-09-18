class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    @order = Order.new
    @order.user = current_user
    @shoe = Shoe.find(params[shoe])
    # @order.shoe = @shoe
  end
end
