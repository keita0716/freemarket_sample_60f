class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]
  validates :nickname, :family_name, :first_name,:family_kana_name,:first_kana_name,:birth_year,:birth_month,:birth_day ,presence: true
  has_many :credit_cards
  has_one :address
  has_one :authentication_phonenumber
  has_many :sns_credentials
  has_many :items
  has_many :saling_items, -> { where("seller_id is not NULL && buyer_id is NULL") }, class_name: "Item"
  has_many :sold_items, -> { where("seller_id is not NULL && buyer_id is not NULL && auction_id is NULL") }, class_name: "Item"
  has_many :auction_items, -> { where("seller_id is not NULL && auction_id is not NULL && buyer_id is NULL") }, class_name: "Item"


  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    # sns認証したことがあればアソシエーションで取得
    # 無ければemailでユーザー検索して取得orビルド(保存はしない)
    user = sns.user || User.where(email: auth.info.email).first_or_initialize(
      nickname: auth.info.name,
        email: auth.info.email
    )
    # userが登録済みの場合はそのままログインの処理へ行くので、ここでsnsのuser_idを更新しておく
    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }
  end

end
