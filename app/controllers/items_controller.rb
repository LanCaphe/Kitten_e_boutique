class ItemsController < ApplicationController
  def index
    @items = Item.all
    puts @items
  end

  def show
  end
end
