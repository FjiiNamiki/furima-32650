class OrdersController < ApplicationController
  def index
    @order_destination = OrderDestination.new
    @item = Item.find(params[:item_id])
  end

  def create
    # binding.pry
    @item = Item.find(params[:item_id])
    @order_destination = OrderDestination.new(order_params)
    if @order_destination.valid?
      @order_destination.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_destination).permit(:token, :zipcode, :prefecture_id, :city, :adress, :building, :phonenumber).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
