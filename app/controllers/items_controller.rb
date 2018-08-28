class ItemsController < ApplicationController
  def index
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
