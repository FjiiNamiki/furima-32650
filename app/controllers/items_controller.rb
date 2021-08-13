class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :update, :show, :destroy]
  before_action :set_item_user, only: [:edit, :update, :destroy]
  
  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to action: :show
    else
      render action: :edit
    end
  end

  def show
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private
  def item_params
    params.require(:item).permit(:title, :discription, :category_id, :condition_id, :shipping_pay_id, :prefecture_id, :transport_day_id, :price, :image).merge(user_id: current_user.id)
  end
  def set_item
    @item = Item.find(params[:id])
  end
  def set_item_user
    if @item.user != current_user
      redirect_to root_path
    end
  end
end
