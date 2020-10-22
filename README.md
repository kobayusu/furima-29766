# アプリケーション名 FURIMA

# アプリケーション概要
  商品の出品・購入
    画像添付・価格設定・出品時利益計算
  出品商品の編集・削除
    商品の画像・商品名・説明文・価格など商品情報の変更

# https://furima-29766.herokuapp.com/

# テスト用アカウント
  購入者用
  メールアドレス: test1@mail.com
  パスワード: password1

  購入用カード情報
  番号：4242424242424242
  期限：3 23
  セキュリティコード：123

  出品者用
  メールアドレス名: test2@mail.com
  パスワード: password2

# 利用方法
  １、ユーザー登録
  トップページ右上の「新規登録」よりユーザー登録画面へ遷移し、必要事項を記入の上ユーザー登録を行う。
  ２、出品
  トップページ右下のカメラマークより出品画面へ遷移し、自身が出品したい物の写真、商品名、商品説明、値段など必要事項を入力し、出品ボタンを押す。
  ３、購入
  トップページの出品一覧より、お求めの商品をクリックし商品詳細ページに遷移、商品購入ボタンを押し、購入画面へ遷移、カード情報などの必要事項を記載し、購入ボタンをクリック
  ４、出品商品の編集
  トップページの出品一覧の中から、自信が出品した物をクリックし、詳細ページ絵遷移したのち、編集ボタンをクリックし編集ページへ遷移、編集したい部分を再入力し「変更する」をクリック
  ５、商品の削除
  自身の出品した商品の詳細ページより、「削除」をクリック

# 目指した課題解決
  家に不要な物があって処分したい方など自宅での隙間時間など時間と場所を問わずフリーマーケットに出品したい方のために、スマホやPCから簡単に商品の取引ができるようにすること

# テーブル設計
ER図



## users テーブル

| Column      | Type   | Options     |
| ----------- | ------ | ----------- |
| nickname    | string | null: false |
| email       | string | null: false |
| password    | string | null: false |
| family_name | string | null: false |
| first_name  | string | null: false |
| family_kana | string | null: false |
| first_kana  | string | null: false |
| birth_day   | date   | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| name              | string     | null: false                    |
| explanation       | text       | null: false                    |
| price             | integer    | null: false                    |
| postage_id        | integer    | null: false                    |
| shipping_day_id   | integer    | null: false                    |
| condition_id      | integer    | null: false                    |
| category_id       | integer    | null: false                    |
| prefecture_id     | integer    | null: false                    |
| user              | references | null: false                    |
| image             | string     | null: false                    |

### Association
- belongs_to :user
- has_one :order

## oders テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| item        | references | null: false, foreign_key: true |
| user        | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :destination

## destinations テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post_number   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building      | string     |                                |
| phone_number  | string     | null: false                    |
| order         | references | null: false, foreign_key: true |

### Association 
- belongs_to :order