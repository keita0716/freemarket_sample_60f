class TopsController < ApplicationController
  
  #以下、コメントアウト部分は後程実装予定分
  #before_action :set_item

  def index
    @items = Item.where(trade_status: "出品中").order(id: "DESC").first(10)
    #@categorys = @items.joins(:category).group("categories.name").order(count_name: "DESC").first(4)
    #@categories_item = @categories.order(id: "DESC").first(10)
    #@brands = @items.joins(:brand).group("brands.name").order(count_name: "DESC").first(4)
    #@brands_item = @brands.order(id: "DESC").first(10)
  end

  def set_item
    #@items = Item.where(trade_status: "出品中")
  end

end