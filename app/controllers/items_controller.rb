class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      return redirect_to root_path
    end
    render :new
  end

  def destroy
    @item = Item.find(params[:id])
    if @item.valid?
      @item.destroy
      return redirect_to root_path
    end
    render :show
  end

  def edit
  end

  def update
  end

  def show
    @item = Item.find(params[:id])
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
