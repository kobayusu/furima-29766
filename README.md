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
｜ birth_day   ｜ date   ｜ null: false ｜

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
｜ shipping       ｜ integer    ｜ null: false                    ｜
｜ condition      ｜ integer    ｜ null: false                    ｜
｜ category       ｜ integer    ｜ null: false                    ｜
｜ prefecture     ｜ integer    ｜ null: false                    ｜
｜ user           ｜ references ｜ null: false                    ｜

### Association

- belongs_to :user
- has_one :order

## oders テーブル

｜ Column      ｜ Type       ｜ Options                        ｜
｜ ----------- ｜ ---------- ｜ ------------------------------ ｜
｜ item        ｜ references ｜ null: false, foreign_key: true ｜
｜ user        ｜ references ｜ null: false, foreign_key: true ｜

### Association

- belongs_to :user
- belongs_to :item
- has_one :destination

## destinations テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| post_number | integer    | null: false                    |
| prefecture  | integer    | null: false                    |
| city        | string     | null: false                    |
| address     | string     | null: false                    |
| building    | string     | null: false                    |
| phon_number | string     | null: false                    |
| oder        | references | null: false, foreign_key: true |

### Association　

- belongs_to :order
