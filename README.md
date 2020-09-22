# テーブル設計

## users テーブル

｜ Column   ｜ Type   ｜ Options     ｜
｜ -------- ｜ ------ ｜ ----------- ｜
｜ name     ｜ string ｜ null: false ｜
｜ email    ｜ string ｜ null: false ｜
｜ password ｜ string ｜ null: false ｜

### Association

- has_many :items
- has_many :orders

## items テーブル

｜ Column         ｜ Type       ｜ Options                        ｜
｜ -------------- ｜ ---------- ｜ ------------------------------ ｜
｜ item_name      ｜ string     ｜ null: false                    ｜
｜ price          ｜ string     ｜ null: false                    ｜
｜ image          ｜ string     ｜ null: false                    ｜
｜ deliverry_date ｜ string     ｜ null: false                    ｜
｜ category       ｜ string     ｜ null: false                    ｜
｜ users_id       ｜ references ｜ null: false, foreign_key: true ｜

### Association

- belongs_to :users
- belongs_to :orders

## oders テーブル

｜ Column   ｜ Type       ｜ Options                        ｜
｜ -------- ｜ ---------- ｜ ------------------------------ ｜
｜ items_id ｜ references ｜ null: false, foreign_key: true ｜
｜ users_id ｜ references ｜ null: false, foreign_key: true ｜

### Association

- belongs_to :users
- belongs_to :destinations

## destination

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| addres   | string     | null: false                    |
| oders_id | references | null: false, foreign_key: true |

### Association

- belongs_to :orders
