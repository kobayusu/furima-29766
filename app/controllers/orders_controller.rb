class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
  end
  
  def new
    @order = order.new
  end

  def create
  end

  private


end
