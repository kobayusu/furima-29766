class OrderDistination
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :token, :post_number, :prifecture_id, :city, :address, :building, :phone_number

  validates :token, :post_number, :prifecture_id, :city, :address, :building, :phone_number, presence: true
  validates :post_number, format:{ with: /\A[0-9]{3}-[0-9]{4}\z/, message: '必ず（-）ハイフンを間に挟んでください'}
  validates :phone_number, format:{ with: /\A\d{11}\z/ }
  validates :prifecture_id, numericality: {other_than: 1, message: "該当するものを選んでください" }
end