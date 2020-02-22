class TopsController < ApplicationController

  def index
    @category = Item.group(:category_id).order('count(category_id) DESC')
    @brand = Item.group(:brand_id).order('count(brand_id) DESC')
    @items = Item.where("buyer_id IS NULL").where("auction_id IS NULL").order(id: "DESC").includes(:images)
    #@categories = @item.joins(:category).group("categories.name").order(count_name: "DESC").first(4)
    #@categories_item = @categories.order(id: "DESC").first(10)
    #@brands = @items.joins(:brand).group("brands.name").order(count_name: "DESC").first(4)
    #@brands_item = @brands.order(id: "DESC").first(10)
  end

    

end