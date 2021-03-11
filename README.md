# テーブル設計

## users テーブル

| Column                   | Type   | Options     |
| ------------------------ | ------ | ----------- |
| nickname                 | string | null: false |
| email                    | string | null: false |
| password                 | string | null: false |
| password_confirmation    | string | null: false |
| name                     | string | null: false |
| kana_name                | string | null: false |
| birthday                 | date   | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column            | Type       | Options     |
| ----------------- | ---------- | ----------- |
| name              | string     | null: false |
| description       | text       | null: false |
| category          | string     | null: false |
| status            | string     | null: false |
| shipping_charges  | string     | null: false |
| shipping_area     | string     | null: false |
| Days_to_ship      | string     | null: false |
| price             | integer    | null: false |

### Association

- belongs_to :user
- has_one :purchases

## purchases テーブル

| Column       | Type       | Options     |
| ------------ | ---------- | ------------|
| user_id      | references | null: false |
| item_id      | references | null: false |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_information

##  shipping_information テーブル

| Column            | Type       | Options     |
| ----------------- | ---------- | ----------- |
| postal code       | integer    | null: false |
| Prefectures       | string     | null: false |
| municipality      | string     | null: false |
| address           | integer    | null: false |
| building_name     | integer    |             |
| phone_number      | integer    | null: false |

### Association

- belongs_to :purchase