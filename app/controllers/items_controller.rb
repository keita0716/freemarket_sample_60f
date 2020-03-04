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
    @messageMoji = ""
    @messageVali = ""
    if @item.images.length == 0
      @messageVali = @messageVali + '「出品画像」'
      @item.images.new
    end
    if @item.name == ""
      @messageVali = @messageVali + '「商品名」'
    else
      if @item.name.length > 40
        @messageMoji = @messageMoji + '「商品名」を40文字以下にしてください。'
      end
    end
    if @item.description == ""
      @messageVali = @messageVali + '「商品の説明」'
    else
      if @item.description.length > 1000
        @messageMoji = @messageMoji + '「商品の説明」を1000文字以下にしてください。'
      end
    end
    if @item.category_id == nil
      @messageVali = @messageVali + '「カテゴリー」'
    end
    if @item.condition_id == nil
      @messageVali = @messageVali + '「商品の状態」'
    end
    if @item.delivery_charge_id == nil
      @messageVali = @messageVali + '「配送料の負担」'
    end
    if @item.shipping_prefecture_id == nil
      @messageVali = @messageVali + '「発送元の地域」'
    end
    if @item.shipping_date_id == nil
      @messageVali = @messageVali + '「発送までの日数」'
    end
    if @item.price == nil
      @messageVali = @messageVali + '「値段」'
    else
      if (0 <= @item.price && @item.price <= 300) || @item.price > 9999999
        @messageMoji = @messageMoji + '「価格」を300〜9,999,999円にしてください。'
      end
    end
    if @messageVali != ""
      @messageVali = @messageVali + "が空です。"
    end
    @message = "#{@messageVali}#{@messageMoji}"
    if @message == ""
      if @item.save
        redirect_to root_path
      else
        render :new
      end
    else
      flash.now[:alert] = "#{@message}"
      render :new
    end
  end

  def edit
    
  end

  def update
    if @item.update(update_params) && params.require(:item).keys[0] == "images_attributes"
      redirect_to root_path 
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
