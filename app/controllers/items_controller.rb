class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:title, :discription, :category_id, :condition_id, :shipping_pay_id, :prefecture_id, :transport_day_id, :price, :image).merge(user_id: current_user.id)
  end
end
