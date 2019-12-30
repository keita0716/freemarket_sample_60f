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
- has_many :review
