class CreditCardsController < ApplicationController
  
  require 'payjp'
  before_action :authenticate_user!
  before_action :set_card

  def new_credit_card
  @credit_card = CreditCard.new  
  card = CreditCard.where(user_id: current_user.id).first
    #インスタンス生成（パラメータを入れる箱）
  end

  def create_credit_card
      Payjp.api_key = 'sk_test_11bb9decc79ff2b8baa12827'
    if params['payjp_token'].blank?
      redirect_to action: "new_credit_card"
    else
      # トークンが正常に発行されたら、顧客情報をPAY.JPに登録。
      customer = Payjp::Customer.create(
        description: 'test', 
        card: params['payjp_token'], 
        metadata: {user_id: current_user.id} 
      )
      @credit_card = CreditCard.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      #ユーザーインスタンスに入力した値を代入
      unless @credit_card.valid?
        flash.now[:alert] = @credit_card.errors.full_messages
        render :new_credit_card and return
      end
      #バリデーションを行い、エラーならnewアクションに戻る
      @credit_card.save
    end
  end
 
  protected

  def credit_card_params
    params.require(:credit_card).permit().merge(user_id: current_user.id)
  end

  private

  def set_card
    @credit_card = CreditCard.where(user_id: current_user.id).first if CreditCard.where(user_id: current_user.id).present?
  end

end