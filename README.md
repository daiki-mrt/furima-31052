# テーブル設計

## usersテーブル

| Column                | Type    | Option      | 
| --------------------- | ------- | ----------- | 
| nickname              | string  | null: false | 
| email                 | string  | null: false | 
| password              | string  | null: false | 
| password_confirmation | string  | null: false | 
| first_name_kanji      | string  | null: false | 
| family_name_kanji     | string  | null: false | 
| first_name_kana       | string  | null: false | 
| family_name_kana      | string  | null: false | 
| birth                 | date    | null: false | 

### Association

has_many :items
has_many :orders


## itemsテーブル

| Column           | Type       | Option            | 
| ---------------- | ---------- | ----------------- | 
| name             | string     | null: false       | 
| content          | text       | null: false       | 
| category_id      | integer    | null: false       | 
| status_id        | integer    | null: false       | 
| charge_type_id   | integer    | null: false       | 
| prefecture_id    | integer    | null: false       | 
| ship_duration_id | integer    | null: false       | 
| price            | integer    | null: false       | 
| user             | references | foreign_key: true | 

### Association

belongs_to :user
has_one :order


## ordersテーブル

| Column         | Type       | Option            | 
| -------------- | ---------- | ----------------- | 
| user           | references | foreign_key: true | 
| item           | references | foreign_key: true | 

### Association

belongs_to :user
belongs_to :item
has_one :address


## addressesテーブル

| Column         | Type       | Option            | 
| -------------- | ---------- | ----------------- | 
| postal_code    | string     | null: false       | 
| prefecture_id  | integer    | null: false       | 
| city           | string     | null: false       | 
| street_num     | string     | null: false       | 
| building       | string     |                   | 
| phone_num      | string     | null: false       | 
| order          | references | foreign_key: true | 

### Association

belongs_to :order