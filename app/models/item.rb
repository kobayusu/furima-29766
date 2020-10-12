class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :shipping_day
  belongs_to_active_hash :postage
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :condition
  
  belongs_to :user
  has_one :order
  has_one_attached :image

  validates :image, :name, :explanation, :postage_id,
            :shipping_day_id, :condition_id, :category_id,
            :prefecture_id, presence: true

  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: '300円〜9,999,999円で価格設定をしてください・半角で記入してください' }

  with_options numericality: { other_than: 1, message: '該当するものを選択してください' } do
    validates :category_id, :condition_id, :postage_id, :shipping_day_id, :prefecture_id
  end
end
