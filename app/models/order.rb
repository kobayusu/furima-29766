class Order < ApplicationRecord
  has_one :destination
  belongs_to :user
  belongs_to :item

  attr_accessor :token
  validates :token, presence: true
  validates :price, presence: true
end
