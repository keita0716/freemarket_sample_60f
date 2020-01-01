# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|email|string|null: false, foreign_key: true|
|nickname|string|null: false, foreign_key: true|
|password|string|null: false, foreign_key: true|
|comment|string|null: false, foreign_key: true|
|user_image_id|integer|null: false, foreign_key: true|
|profile_id|integer|null: false, foreign_key: true|
|credit_card_id|integer|null: false, foreign_key: true|
|good_id|integer|null: false, foreign_key: true|
|review_id|integer|null: false, foreign_key: true|
|negotiation_comment_id|integer|null: false, foreign_key: true|
|trading_person_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|

### Association
- has_many :items
- has_many :items
- has_many :goods
- has_many :trading_persons
- has_one :user_image
- has_one :credit_card
- has_one :profile


## profilesテーブル

|Column|Type|Options|
|------|----|-------|
|profile_id|integer|null: false, foreign_key: true|
|family_name|string|null: false, foreign_key: true|
|first_name|string|null: false, foreign_key: true|
|family_kana_name|string|null: false, foreign_key: true|
|first_kana_name|string|null: false, foreign_key: true|
|birth_year|date|null: false, foreign_key: true|
|birth_month|date|null: false, foreign_key: true|
|birth_day|date|null: false, foreign_key: true|
|postal code|string|null: false, foreign_key: true|
|Prefecture|string|null: false, foreign_key: true|
|city|string|null: false, foreign_key: true|
|block|string|null: false, foreign_key: true|
|building|string|null: false, foreign_key: true|
|tel|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user


## user_imagesテーブル

|Column|Type|Options|
|------|----|-------|
|user_image_id|integer|null: false, foreign_key: true|
|user_image|string|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user


## credit_cardsテーブル

|Column|Type|Options|
|------|----|-------|
|credit_card_id|integer|null: false, foreign_key: true|
|card_number|integer|null: false, foreign_key: true|
|card_limit_year|date|null: false, foreign_key: true|
|card_limit_month|date|null: false, foreign_key: true|
|security_number|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user


## trading_personsテーブル

|Column|Type|Options|
|------|----|-------|
|trading_person_id|integer|null: false, foreign_key: true|
|buyer_id|integer|null: false, foreign_key: true|
|seller_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- has_many :negotiation_comments
- has_many :reviews


## goodsテーブル

|Column|Type|Options|
|------|----|-------|
|good_id|integer|null: false, foreign_key: true|
|good|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item


## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|item_id|integer|null: false, foreign_key: true|
|item_name|string|null: false, foreign_key: true|
|item_description|string|null: false, foreign_key: true|
|item_condition|string|null: false, foreign_key: true|
|size|integer|null: false, foreign_key: true|
|delivery_charge|integer|null: false, foreign_key: true|
|shipping_date|date|null: false, foreign_key: true|
|shipping_method|string|null: false, foreign_key: true|
|shipping_prefecture|string|null: false, foreign_key: true|
|price|string|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|
|brand_id|integer|null: false, foreign_key: true|
|category_id|integer|null: false, foreign_key: true|
|item_image_id|integer|null: false, foreign_key: true|


### Association
- belongs_to :user
- belongs_to :categorie
- belongs_to :brand
- has_many :item_images
- has_many :goods
- has_many :negotiation_comments
- has_many :reviews

## item_imagesテーブル

|Column|Type|Options|
|------|----|-------|
|item_image_id|integer|null: false, foreign_key: true|
|item_image|string|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :item


## categorysテーブル

|Column|Type|Options|
|------|----|-------|
|category_id|integer|null: false, foreign_key: true|
|categorie_name|string|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|

### Association
- has_many :items


## brandsテーブル

|Column|Type|Options|
|------|----|-------|
|brand_id|integer|null: false, foreign_key: true|
|brand_name|string|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|

### Association
- has_many :items


## negotiation_commentsテーブル

|Column|Type|Options|
|------|----|-------|
|negotiation_comment_id|integer|null: false, foreign_key: true|
|negotiation_comment|string|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|
|trading_person_id_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :item
- belongs_to :trading_person


## reviewsテーブル

|Column|Type|Options|
|------|----|-------|
|review_id|integer|null: false, foreign_key: true|
|review|string|null: false, foreign_key: true|
|trading_person_id_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :trading_person