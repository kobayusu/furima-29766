# テーブル設計

## users テーブル

｜ Column      ｜ Type   ｜ Options     ｜
｜ ----------- ｜ ------ ｜ ----------- ｜
｜ nickname    ｜ string ｜ null: false ｜
｜ email       ｜ string ｜ null: false ｜
｜ password    ｜ string ｜ null: false ｜
｜ family_name ｜ string ｜ null: false ｜
｜ first_name  ｜ string ｜ null: false ｜
｜ family_kana ｜ string ｜ null: false ｜
｜ first_kana  ｜ string ｜ null: false ｜
｜ birth_day   ｜ string ｜ null: false ｜

### Association

- has_many :items
- has_many :orders

## items テーブル

｜ Column         ｜ Type       ｜ Options                        ｜
｜ -------------- ｜ ---------- ｜ ------------------------------ ｜
｜ name           ｜ string     ｜ null: false                    ｜
｜ explanation    ｜ text       ｜ null: false                    ｜
｜ price          ｜ integer    ｜ null: false                    ｜
｜ image          ｜ string     ｜ null: false                    ｜
｜ deliverry_date ｜ string     ｜ null: false                    ｜
｜ shipping       ｜ string     ｜ null: false                    ｜
｜ condition      ｜ string     ｜ null: false                    ｜
｜ category       ｜ string     ｜ null: false                    ｜
｜ prefecture     ｜ string     ｜ null: false                    ｜
｜ users          ｜ references ｜ null: false, foreign_key: true ｜

### Association

- belongs_to :users
- has_one :orders

## oders テーブル

｜ Column      ｜ Type       ｜ Options                        ｜
｜ ----------- ｜ ---------- ｜ ------------------------------ ｜
｜ items       ｜ references ｜ null: false, foreign_key: true ｜
｜ users       ｜ references ｜ null: false, foreign_key: true ｜

### Association

- belongs_to :users
- belongs_to :items
- has_one :destinations

## destinations

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| post_number | integer    | null: false                    |
| prefecture  | string     | null: false                    |
| city        | string     | null: false                    |
| address     | string     | null: false                    |
| building    | string     | null: false                    |
| phon_number | integer    | null: false                    |
| oders       | references | null: false, foreign_key: true |

### Association

- belongs_to :orders
