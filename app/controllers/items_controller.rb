class ItemsController < ApplicationController
  
  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
    @sellUser = User.find(@item.user_id)
    @itemBrand = Brand.find(@item.brand_id)
    @itemCategory = Category.find(@item.category_id)
  end

end