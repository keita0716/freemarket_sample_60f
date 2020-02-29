class PurchaseItemsController < ApplicationController



  def show
    @item = Item.find(params[:id])
    @sellUser = User.find(@item.seller_id)
    @itemCategory = Category.find(@item.category_id)
    @images = Image.where(item_id:params[:id])
    @addresses = Address.find_by(user_id: current_user.id)

  end

end