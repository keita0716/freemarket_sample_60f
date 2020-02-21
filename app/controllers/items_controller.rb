class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create,:items_exhibiting,:items_transaction,:items_soldout]
  before_action :set_current_user_items,only:[:items_transaction,:items_exhibiting,:items_soldout]
  before_action :set_user,only:[:items_transaction,:items_exhibiting,:items_soldout]
  def index
    @items = Item.includes(:images).order('created_at DESC')
  end

  def new
    @item = Item.new
    @item.images.new
  end

  def show
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

  def items_exhibiting #出品中
  end

  def items_transaction  #取引中
  end

  def items_soldout    #売却済み
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
