# テーブル設計

## usersテーブル

| Column                | Type    | Option      | 
| --------------------- | ------- | ----------- | 
| nickname              | string  | null: false | 
| email                 | string  | null: false | 
| password              | string  | null: false | 
| password_confirmation | string  | null: false | 
| name_kanji            | string  | null: false | 
| name_kana             | string  | null: false | 
| birth_y               | integer | null: false | 
| birth_m               | integer | null: false | 
| birth_d               | integer | null: false | 

### Association

has_many :items
has_many :orders


## itemsテーブル

| Column        | Type       | Option            | 
| ------------- | ---------- | ----------------- | 
| name          | string     | null: false       | 
| contnt        | text       | null: false       | 
| category      | string     | null: false       | 
| status        | string     | null: false       | 
| charge_type   | string     | null: false       | 
| ship_from     | string     | null: false       | 
| ship_duration | string     | null: false       | 
| price         | integer    | null: false       | 
| user_id       | references | foreign_key: true | 

### Association

belongs_to :user
has_one :order


## ordersテーブル

| Column         | Type       | Option            | 
| -------------- | ---------- | ----------------- | 
| user_id        | references | foreign_key: true | 
| item_id        | references | foreign_key: true | 
| credit_num     | integer    | null: false       | 
| credit_valid_m | integer    | null: false       | 
| security_code  | integer    | null: false       | 
| postal_code    | integer    | null: false       | 
| prefecture     | string     | null: false       | 
| city           | string     | null: false       | 
| str_num        | string     | null: false       | 
| building       | string     |                   | 
| phone_num      | integer    | null: false       | 

### Association

belongs_to :user
belongs_to :item