class ItemsController < ApplicationController
  def index
  end

  def new
    @items = Items.new
  end
end
