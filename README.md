# テーブル設計

## users テーブル
| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null:false  |
| email    | string | null:false  |
| password | string | null:false  |

### Association
- has_many :items
- has_many :purchases

## items テーブル
| Column      | Type       | Options                      |
| ----------- | ---------- | ---------------------------- |
| name        | string     | null:false                   |
| text        | text       | null:false                   |
| category    | string     | null:false                   |
| state       | string     | null:false                   |
| prefectures | string     | null:false                   |
| day         | string     | null:false                   |
| price       | integer    | null:false                   |
| user_id     | references | null:false, foreign_key:true |

### Association
- has_one :purchase
- belongs_to :user

## purchases テーブル
| Column      | Type       | Options                      |
| ----------- | ---------- | ---------------------------- |
| postal_code | integer    | null:false                   |
| prefectures | string     | null:false                   |
| city        | string     | null:false                   |
| address     | string     | null:false                   |
| phone       | integer    | null:false                   |
| user_id     | references | null:false, foreign_key:true |
| item_id     | references | null:false, foreign_key:true |

### Association
- belongs_to :user
- belongs_to :item