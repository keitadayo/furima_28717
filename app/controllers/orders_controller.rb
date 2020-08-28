class OrdersController < ApplicationController
  before_action :move_to_user_login

  def index
    @order = Order.new
    @item = Item.find(params[:item_id])
    @shipping_address = ShippingAddress.new
  end

  def move_to_user_login
    redirect_to new_user_session_path unless user_signed_in?
  end
end
