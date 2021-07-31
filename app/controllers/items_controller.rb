class ItemsController < ApplicationController
  def index
  end

  def new
    @items = Items.new
  end

  def create
    Items.create(item_params)
  end

  private
  def item_params
    prams.require(:items).permit(:title, :discription, :category_id, :condition_id, :shipping_pay_id, :prefecture_id, :transport_day_id, :price, :image).merge(user_id: current_user.id)
  end
end
