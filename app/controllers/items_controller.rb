class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create,:saling_items,:trading_items,:soldout_items,:buyer_maker,:purchase_complete ]
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
    @sellUser = User.find(@item.seller_id)
    @itemCategory = Category.find(@item.category_id)
    @images = Image.where(item_id:params[:id])
  end

  def create
    @item = Item.new(item_params)
    @message = ""
    if @item.images.length == 0
      @message= '「出品画像」'
      @item.images.new
    end
    if @item.name == ""
      @message = @message + '「商品名」'
    end
    if @item.description == ""
      @message = @message + '「商品の説明」'
    end
    if @item.category_id == nil
      @message = @message + '「カテゴリー」'
    end
    if @item.condition_id == nil
      @message = @message + '「商品の状態」'
    end
    if @item.delivery_charge_id == nil
      @message = @message + '「配送料の負担」'
    end
    if @item.shipping_prefecture_id == nil
      @message = @message + '「発送元の地域」'
    end
    if @item.shipping_date_id == nil
      @message = @message + '「発送までの日数」'
    end
    if @item.price == nil
      @message = @message + '「値段」'
    end
    if @message == ""
      if @item.save
        redirect_to root_path
      else
        render :new
      end
    else
      flash.now[:alert] = "#{@message}が空です。"
      render :new
    end


  end

  def edit
    
  end


  def update
    if @item.update(update_params) && params.require(:item).keys[0] == "images_attributes"
      redirect_to root_path ,notice: '商品を編集しました'
    else
      flash[:alert] = '編集に失敗しました。必須項目を確認してください。'
      redirect_to edit_item_path
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

  def purchase_confirmation   
  end
  
  def purchase_complete   
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :description, :category_id, :condition_id, :delivery_charge_id,:shipping_date_id, :shipping_prefecture_id, images_attributes: [:src]).merge(seller_id: current_user.id) 
  end

  def update_params
    params.require(:item).permit(:name, :price, :description, :category_id, :condition_id, :delivery_charge_id,:shipping_date_id, :shipping_prefecture_id, images_attributes: [:src,:id]).merge(seller_id: current_user.id) 
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
