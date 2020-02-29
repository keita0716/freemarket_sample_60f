# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  def new
    @user = User.new
    #ユーザーインスタンス生成（パラメータを入れる箱）
  end

  def create
    if params[:sns_auth] == 'true'
      pass = Devise.friendly_token
      params[:user][:password] = pass
      params[:user][:password_confirmation] = pass
    end
    @user = User.new(sign_up_params)
    #ユーザーインスタンスに入力した値を代入
    unless @user.valid?
      flash.now[:alert] = @user.errors.full_messages
      render :new and return
    end
    #バリデーションを行い、エラーならnewアクションに戻る
    session["devise.regist_data"] = {user: @user.attributes}
    session["devise.regist_data"][:user]["password"] = params[:user][:password]
    #セッションにユーザーの情報を保存する。このときattributesメソッドでデータを整形。attributesメソッドを通した後はパスワード情報は含まれないためパスワードを再度sessionに入れる
    redirect_to action: :new_authentication_phonenumber
    #new_authentication_phonenumberに移動
  end

  def new_authentication_phonenumber
    @authentication_phonenumber = AuthenticationPhonenumber.new
       #バリデーションを行い、エラーならnew_authentication_phonenumberアクションに戻る 
  end

  #form_forでsubmitした時にcreate_authentication_phonenumberが発火
  def create_authentication_phonenumber
    @user = User.new(session["devise.regist_data"]["user"])
    @address = @user.build_address
    @authentication_phonenumber = AuthenticationPhonenumber.new(authentication_phonenumber_params)
    unless @authentication_phonenumber.valid?
      flash.now[:alert] = @authentication_phonenumber.errors.full_messages
      render :new_authentication_phonenumber and return
       #バリデーションを行い、エラーならnew_authentication_phonenumberアクションに戻る
    end  
    #アドレスモデルのインスタンス生成
    render :new_address
     #new_addressに移動
  end

  def create_address
    #ユーザーインスタンスにセッションの値を代入
    @user = User.new(session["devise.regist_data"]["user"])
    @address = Address.new(address_params)
     #アドレスインスタンスに入力した値を代入
    unless @address.valid?
      flash.now[:alert] = @address.errors.full_messages
      render :new_address and return
       #バリデーションを行い、エラーならnew_addressアクションに戻る
    end    
    @user.build_address(@address.attributes)
    @user.save
    #sessionのデータをテーブルに保存
    sign_in(:user, @user)
    #サインイン
    redirect_to credit_cards_path
    #レンダーではなくリダイレクト
  end

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  end

  def address_params
    params.require(:address).permit(:address_family_name,:address_first_name,:address_family_kana_name,:address_first_kana_name,:zipcode,:prefecture,:city,:block,:building,:tel)
  end

  def authentication_phonenumber_params
    params.require(:authentication_phonenumber).permit(:authentication_phonenumber) 
  end
end
