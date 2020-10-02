class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category, :condition, :postage, :shipping_day, :prefecture
  belongs_to :user
  has_one :order

  validates :name, :explanation, :price, :postage_id, 
            :shipping_day_id, :condition_id, :category_id,
            :prefecture_id, :user, :image, presence: true
  
  validates :category_id, :condition_id, 
            :postage_id, :shipping_day_id,
            :prefecture_id, numericality: { other_than: 1 }
end