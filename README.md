# テーブル設計

## users テーブル

| Column                   | Type   | Options      |
| ------------------------ | ------ | ------------ |
| nickname                 | string | null: false  |
| email                    | string | unique: true |
| encrypted_password       | string | null: false  |
| last_name                | string | null: false  |
| first_name               | string | null: false  |
| last_name_kana           | string | null: false  |
| first_name_kana          | string | null: false  |
| birthday                 | date   | null: false  |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column              | Type       | Options     |
| ------------------- | ---------- | ----------- |
| name                | string     | null: false |
| description         | text       | null: false |
| category_id         | integer    | null: false |
| status_id           | integer    | null: false |
| shipping_charge_id  | integer    | null: false |
| shipping_area_id    | integer    | null: false |
| Days_to_ship_id     | integer    | null: false |
| price               | integer    | null: false |

### Association

- belongs_to :user
- has_one :purchases

## orders テーブル

| Column       | Type       | Options           |
| ------------ | ---------- | ------------------|
| user_id      | references | foreign_key: true |
| item_id      | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :addresses

##  addresses テーブル

| Column            | Type       | Options           |
| ----------------- | ---------- | ----------------- |
| postal code       | string     | null: false       |
| shipping_area_id  | integer    | null: false       |
| municipality_id   | integer    | null: false       |
| address           | integer    | null: false       |
| building_name     | integer    |                   |
| phone_number      | string     | null: false       |
| order_id          | references | foreign_key: true |

### Association

- belongs_to :order