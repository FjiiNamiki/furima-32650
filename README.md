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

# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| lastname_kanji     | string | null: false               |
| firstname_kanji    | string | null: false               |
| lastname_kana      | string | null: false               |
| firstname_kana     | string | null: false               |
| birthday           | date   | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |


### Association

- has_many :items
- has_many :orders
- has_many :comments

## items テーブル

| Column             | Type            | Options                        |
| ------------------ | --------------- | ------------------------------ |
| title              | string          | null: false                    |
| discription        | text            | null: false                    |
| category_id        | integer         | null: false                    |
| condition_id       | integer         | null: false                    |
| shipping_pay_id    | integer         | null: false                    |
| prefecture_id      | integer         | null: false                    |
| transport_day_id   | integer         | null: false                    |
| price              | integer         | null: false                    |
| user               | references      | null: false, foreign_key: true |

### Association

- has_many :comments
- belongs_to :user
- has_one :order

## orders テーブル

| Column             | Type            | Options                        |
| ------------------ | --------------- | ------------------------------ |
| user               | references      | null: false, foreign_key: true |
| item               | references      | null: false, foreign_key: true |


### Association

- belongs_to :item
- belongs_to :user
- has_one :destination


## destinations テーブル

| Column             | Type            | Options                        |
| ------------------ | --------------- | ------------------------------ |
| zipcode            | string          | null: false                    |
| prefecture_id      | integer         | null: false                    |
| city               | string          | null: false                    |
| adress             | string          | null: false                    |
| building           | string          |                                |
| phonenumber        | string          | null: false                    |
| order              | references      | null: false, foreign_key: true |

### Association

- belongs_to :order


## comments テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| text         | text       | null: false,                   |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
