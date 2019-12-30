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
|family_name|string|null: false, foreign_key: true|
|first_name|string|null: false, foreign_key: true|
|family_kana_name|string|null: false, foreign_key: true|
|first_kana_name|string|null: false, foreign_key: true|
|birthday|date|null: false, foreign_key: true|
|nickname|string|null: false, foreign_key: true|
|email|string|null: false, foreign_key: true|
|tel|integer|null: false, foreign_key: true|
|address|string|null: false, foreign_key: true|
|postal code|string|null: false, foreign_key: true|
|Prefecture|string|null: false, foreign_key: true|
|city|string|null: false, foreign_key: true|
|building|string|null: false, foreign_key: true|
|password|string|null: false, foreign_key: true|
|userimage|string|null: false, foreign_key: true|
|card_number|integer|null: false, foreign_key: true|
|card_limit|integer|null: false, foreign_key: true|
|security_cord|integer|null: false, foreign_key: true|

### Association
- has_many :items
- has_one :user_adress
- has_one :user_card
- has_many :reviews


## adressテーブル

|Column|Type|Options|
|------|----|-------|
|adress_id|integer|null: false, foreign_key: true|
|postal_code|string|null: false, foreign_key: true|
|prefecture|string|null: false, foreign_key: true|
|city|string|null: false, foreign_key: true|
|building|string|null: false, foreign_key: true|

### Association
- belongs_to :user


## cardsテーブル

|Column|Type|Options|
|------|----|-------|
|card_id|integer|null: false, foreign_key: true|
|card_number|integer|null: false, foreign_key: true|
|card_limit|date|null: false, foreign_key: true|
|security_number|integer|null: false, foreign_key: true|

### Association
- belongs_to :user


## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|item_id|integer|null: false, foreign_key: true|
|item_name|string|null: false, foreign_key: true|
|item_image|string|null: false, foreign_key: true|
|item_description|string|null: false, foreign_key: true|
|brand|string|null: false, foreign_key: true|
|condition|string|null: false, foreign_key: true|
|size|integer|null: false, foreign_key: true|
|delivery_charge|integer|null: false, foreign_key: true|
|date_of_shipment|date|null: false, foreign_key: true|
|area|string|null: false, foreign_key: true|
|price|string|null: false, foreign_key: true|
|good|string|null: false, foreign_key: true|
|users_id|integer|null: false, foreign_key: true|
|buyer_id|integer|null: false, foreign_key: true|
|category_id|integer|null: false, foreign_key: true|
|item_image_id|integer|null: false, foreign_key: true|


### Association
- belongs_to :user
- has_one :category
- has_one :item_image
- has_many :reviews

## item_imagesテーブル

|Column|Type|Options|
|------|----|-------|
|item_image_id|integer|null: false, foreign_key: true|


### Association
- belongs_to :item


## categorysテーブル

|Column|Type|Options|
|------|----|-------|
|category_id|integer|null: false, foreign_key: true|


### Association
- belongs_to :item