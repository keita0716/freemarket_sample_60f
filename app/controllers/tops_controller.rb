class TopsController < ApplicationController
  def index
    @items = Item.where(trade_status: "出品中").order(id: "DESC").first(10)
    #@image = @items.images.first .includes(:image)
  end
end