class TopsController < ApplicationController

  def index
    @category = Item.joins(:category).group(:category_left_id).order('count(category_left_id) DESC')
    @brand = Item.group(:brand_id).order('count(brand_id) DESC').where("brand_id is not null")
    @items = Item.order(id:"DESC").includes(:images)
    #@category = Item.joins(:category).group(:category_left_id).where("buyer_id IS NULL").where("auction_id IS NULL").order('count(category_left_id) DESC')
    #@brand = Item.group(:brand_id).order('count(brand_id) DESC').where("brand_id is not null").where("buyer_id IS NULL").where("auction_id IS NULL")
    #@items = Item.where("buyer_id IS NULL").where("auction_id IS NULL").order(id:"DESC").includes(:images)
  end
  
end