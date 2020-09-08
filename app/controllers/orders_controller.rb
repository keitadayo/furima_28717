class OrdersController < ApplicationController
  before_action :move_to_user_login, :if_exhibitor, :if_sold

  def index
    @order = OrderShippingAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @order = OrderShippingAddress.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render "index"
    end
  end

  private

  def move_to_user_login
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def if_exhibitor
    if current_user.id == Item.find(params[:item_id]).user_id
      redirect_to root_path
    end
  end

  def if_sold
    if Order.exists?(item_id: (params[:item_id]))
      redirect_to root_path
    end
  end

  def order_params
    params.require(:order_shipping_address).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: Item.find(params[:item_id]).price,
      card: params[:token],
      currency:'jpy'
    )
  end

end