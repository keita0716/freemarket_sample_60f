class TopsController < ApplicationController
  
  #以下、コメントアウト部分は後程実装予定分

  def index
    @items = Item.where("buyer_id IS NULL").where("auction_id IS NULL").order(id: "DESC").includes(:images)
    #@categories = @item.joins(:category).group("categories.name").order(count_name: "DESC").first(4)
    #@categories_item = @categories.order(id: "DESC").first(10)
    #@brands = @items.joins(:brand).group("brands.name").order(count_name: "DESC").first(4)
    #@brands_item = @brands.order(id: "DESC").first(10)
  end

end