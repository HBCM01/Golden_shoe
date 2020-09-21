class ChargesController < ApplicationController
  def new

  end

  def create
  # Amount in cents
  @amount = 500 + @basket.total_price * 100

  customer = Stripe::Customer.create({
    email: params[:stripeEmail],
    source: params[:stripeToken],
  })

  charge = Stripe::Charge.create({
    customer: customer.id,
    amount: @amount,
    description: 'Golden Shoe Order',
    currency: 'GBP',
  })

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_basket_charge_path(:basket_id)
  end
end
