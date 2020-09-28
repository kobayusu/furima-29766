class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  
  def index
  end

  def new
  end

  def create
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
    unless user_singed_in?
      redirect_to action: :index
    end
  end

end
