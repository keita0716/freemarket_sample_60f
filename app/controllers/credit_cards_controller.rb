class CreditCardsController < ApplicationController
  
  require 'payjp'
  before_action :authenticate_user!
  before_action :card_exist, only: [:create_credit_card]
  


  def new_credit_card
    @credit_card = CreditCard.new
    #インスタンス生成（パラメータを入れる箱）
  end

  def create_credit_card
    Payjp.api_key = "sk_test_11bb9decc79ff2b8baa12827"
    
    @credit_card = CreditCard.new(credit_card_params)
  #ユーザーインスタンスに入力した値を代入
  unless @credit_card.valid?
    flash.now[:alert] = @credit_card.errors.full_messages
    render :new_credit_card and return
  end
  #バリデーションを行い、エラーならnewアクションに戻る
  @credit_card.save
  end
 
  protected

  def credit_card_params
    params.require(:credit_card).permit(:card_number,:card_limit_month,:card_limit_year,:security_number).merge(user_id: current_user.id)
  end

  def card_exist
    @credit_card = CreditCard.where(user_id: current_user.id).first
    redirect_to action: "new_credit_card" if @credit_card.blank?
　end
end