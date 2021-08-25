class OrdersController < ApplicationController
  def index
    @order_destination = OrderDestination.new
    @item = Item.find(params[:item_id])
    if user_signed_in? == false
      redirect_to "/users/sign_in"
    elsif current_user.id == @item.user_id
        redirect_to root_path
    elsif @item.order.present?
      redirect_to root_path
    end
  end

  def create
    @item = Item.find(params[:item_id])
    @order_destination = OrderDestination.new(order_params)
    if @order_destination.valid?
      pay_item
      @order_destination.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  
  def order_params
    params.require(:order_destination).permit(:zipcode, :prefecture_id, :city, :adress, :building, :phonenumber).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy'
      )
  end
end
