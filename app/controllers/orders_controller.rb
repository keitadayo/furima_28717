class OrdersController < ApplicationController
  before_action :move_to_user_login

  def index
    @order = OrderShippingAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @order = OrderShippingAddress.new(order_params)
    if @order.valid?
      @order.save
      redirect_to root_path
    else
      render "index"
    end
  end

  private

  def move_to_user_login
    redirect_to new_user_session_path unless user_signed_in?
  end

  def order_params
    params.require(:order_shipping_address).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end