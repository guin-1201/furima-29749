# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| last_name_kana  | string | null: false |
| first_name_kana | string | null: false |
| birthday      | integer | null: false |

### Association

- has_many :items
- has_many :purchases


## items テーブル

| Column                | Type   | Options     |
| --------------------- | ------ | ----------- |
| image                 | text   | null: false |
| product               | string | null: false |
| product_description   | string | null: false |
| Categories            | string | null: false |
| status                | string | null: false |
| shipping_charge_class | string | null: false |
| ship_address          | string | null: false |
| ship_date_class       | string | null: false |
| price                 | integer | null: false |
| fee                   | integer | null: false |
| profit                | integer | null: false |

### Association

- belongs_to :user
- has_many :purchases


## purchases テーブル

| Column      | Type   | Options     |
| ----------- | ------ | ----------- |
| card_number | string | null: false |
| exp_month   | string | null: false |
| exp_year   | string | null: false |
| cvc_number  | string | null: false |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address


## addresses テーブル

| Column        | Type   | Options     |
| ------------- | ------ | ----------- |
| postal_code   | string | null: false |
| prefecture    | integer | null: false |
| city          | string | null: false |
| house_number  | string | null: false |
| building_name | string | null: false |
| phone         | string | null: false |

### Association

- belongs_to :purchase