class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create,:saling_items,:trading_items,:soldout_items,:buyer_maker]
  before_action :set_current_user_items,only:[:trading_items,:saling_items,:soldout_items,:buyer_maker]
  before_action :set_user,only:[:trading_items,:saling_items,:soldout_items,:buyer_maker]
  def index
    @items = Item.includes(:images).order('created_at DESC')
  end

  def new
    @item = Item.new
    @item.images.new
  end

  def show
    @item = Item.find(params[:id])
    @sellUser = User.find(@item.user_id)
    @itemBrand = Brand.find(@item.brand_id)
    @itemCategory = Category.find(@item.category_id)
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end


  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  def saling_items #出品中
  end

  def trading_items  #取引中
  end

  def soldout_items    #売却済み
  end


  private

  def item_params
  params.require(:item).permit(:name, :price, :description, :category_id, :condition_id, :delivery_charge_id,:shipping_date_id, :shipping_prefecture_id, images_attributes: [:src]).merge(seller_id: current_user.id) 
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_current_user_items
    if user_signed_in? 
      @items = current_user.items.includes(:seller,:buyer,:auction,images_attributes: [:src])
    else
      redirect_to new_user_session_path
    end
  end

  def set_user
    @user = User.find(current_user.id)
  end
end
