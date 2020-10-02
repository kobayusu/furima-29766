class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category, :postage_id
  belongs_to :user
  has_one :order
  has_one_attached :image

  validates :name, :explanation, :price, :postage_id,
            :shipping_day_id, :condition_id, :category_id,
            :prefecture_id, :user, :image, presence: true

  with_options numericality: { other_than: 1 } do
    validates :category_id, :condition_id, :postage_id, :shipping_day_id, :prefecture_id
  end
end
