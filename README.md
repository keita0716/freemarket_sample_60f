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
|email|string|null: false, unique: true|
|nickname|string|null: false, index: true|
|password|string|null: false|
|comment|string|---|
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
|family_name|string|null: false|
|first_name|string|null: false|
|family_kana_name|string|null: false|
|first_kana_name|string|null: false|
|birth_year|date|null: false|
|birth_month|date|null: false|
|birth_day|date|null: false|
|postal code|string|null: false|
|Prefecture|string|null: false|
|city|string|---|
|block|string|---|
|building|string|---|
|tel|integer|null: false,unique: true|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user


## user_imagesテーブル

|Column|Type|Options|
|------|----|-------|
|user_image|string|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user


## credit_cardsテーブル

|Column|Type|Options|
|------|----|-------|
|card_number|integer|null: false|
|card_limit_year|date|null: false|
|card_limit_month|date|null: false|
|security_number|integer|null: false|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user


## trading_personsテーブル

|Column|Type|Options|
|------|----|-------|
|buyer_id|integer|null: false, foreign_key: true|
|seller_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- has_many :negotiation_comments
- has_many :reviews


## goodsテーブル

|Column|Type|Options|
|------|----|-------|
|good|integer|---|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item


## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|item_name|string|null: false, index: true|
|item_description|string|null: false|
|item_condition|string|null: false|
|size|integer|null: false|
|delivery_charge|integer|null: false|
|shipping_date|date|null: false|
|shipping_method|string|null: false|
|shipping_prefecture|string|null: false|
|price|string|null: false|
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
|item_image|string|---|
|item_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :item


## categorysテーブル

|Column|Type|Options|
|------|----|-------|
|categorie_name|string|null: false, index: true|
|item_id|integer|null: false, foreign_key: true|

### Association
- has_many :items


## brandsテーブル

|Column|Type|Options|
|------|----|-------|
|brand_name|string|null: false, index: true|
|item_id|integer|null: false, foreign_key: true|

### Association
- has_many :items


## negotiation_commentsテーブル

|Column|Type|Options|
|------|----|-------|
|negotiation_comment|string|---|
|item_id|integer|null: false, foreign_key: true|
|trading_person_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :item
- belongs_to :trading_person


## reviewsテーブル

|Column|Type|Options|
|------|----|-------|
|review|string|---|
|trading_person_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :trading_person