class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
  end

  def edit
  end

  def update
  end

  def show
  end

  private

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def item_params
    params.require(:item).permit(
      :name, :explanation, :price, :postage_id,
      :shipping_day_id, :condition_id,
      :category_id, :prefecture_id, :image
    ).merge(user_id: current_user.id)
  end
end
