class OrdersController < ApplicationController
  def index
    @order_destination = OrderDestination.new
    @item = Item.find(params[:item_id])
  end

  def create
    @order_destination = OrderDestination.new(order_params)
    if @order_destination.valid?
      @order_destination.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order_destination).permit(:zipcode, :prefecture, :city, :adress, :building, :phonenumber).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
