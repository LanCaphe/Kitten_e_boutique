class ItemsController < ApplicationController
  def index
    if params[:category] && Category.find_by(name: params[:category])
      @items = Category.find_by(name: params[:category]).items
    else
      @items = Item.all
    end
  end

  def show
    begin
      @item = Item.find(params[:id])
    rescue StandardError => e
      p e.message
    end
    redirect_to root_path if !@item
  end
end
