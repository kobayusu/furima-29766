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

  validates :name, :explanation, :price, :postage_id,
            :shipping_day_id, :condition_id, :category_id,
            :prefecture_id, :user, presence: true

  with_options numericality: { other_than: 1 } do
    validates :category_id, :condition_id, :postage_id, :shipping_day_id, :prefecture_id
  end
end
