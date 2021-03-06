# テーブル設計

## users テーブル
| Column          | Type     | Options     |
| --------------- | -------- | ----------- |
| nickname        | string   | null:false  |
| email           | string   | null:false  |
| password        | string   | null:false  |
| last_name       | string   | null:false  |
| first_name      | string   | null:false  |
| last_name_kana  | string   | null:false  |
| first_name_kana | string   | null:false  |
| birthday        | datetime | null:false  |

### Association
- has_many :items
- has_many :orders

## items テーブル
| Column       | Type       | Options                      |
| ------------ | ---------- | ---------------------------- |
| name         | string     | null:false                   |
| text         | text       | null:false                   |
| category     | integer    | null:false                   |
| state        | integer    | null:false                   |
| prefectures  | integer    | null:false                   |
| shipping_fee | integer    | null:false                   |
| day          | integer    | null:false                   |
| price        | integer    | null:false                   |
| user_id      | references | null:false, foreign_key:true |

### Association
- has_one :order
- belongs_to :user

## orders テーブル
| Column      | Type       | Options                      |
| ----------- | ---------- | ---------------------------- |
| user_id     | references | null:false, foreign_key:true |
| item_id     | references | null:false, foreign_key:true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :shipping_address

## shipping_address テーブル
| Column      | Type       | Options                      |
| ----------- | ---------- | ---------------------------- |
| postal_code | string     | null:false                   |
| prefectures | integer    | null:false                   |
| city        | string     | null:false                   |
| address     | string     | null:false                   |
| building    | string     |                              |
| phone       | string     | null:false                   |

### Association
- belongs_to :order