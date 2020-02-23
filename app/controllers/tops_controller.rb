class TopsController < ApplicationController

  def index
    @category = Item.joins(:category).group(:category_left_id).order('count(category_left_id) DESC')
    @brand = Item.group(:brand_id).order('count(brand_id) DESC')
    #@category_items = Item.joins(:category).where("buyer_id IS NULL").where("auction_id IS NULL").order(id: "DESC").includes(:images)
    @items = Item.where("buyer_id IS NULL").where("auction_id IS NULL").order(id:"DESC").includes(:images)
  end

    

end