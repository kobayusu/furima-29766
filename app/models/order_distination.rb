class OrderDistination
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :token, :post_number, :prifecture_id, :city, :address, :building, :phone_number

  validates :token, :post_number, :prifecture_id, :city, :address, :building, :phone_number, presence: true
  validates :post_number, format:{ with: /\A[0-9]{3}-[0-9]{4}\z/, message: '必ず（-）ハイフンを間に挟んでください'}
  validates :phone_number, format:{ with: /\A\d{11}\z/ }
  validates :prifecture_id, numericality: {other_than: 1, message: "該当するものを選んでください" }

  def save
    #オーダー情報を保存、order変数に代入
    order = Order.create(user_id: user_id, item_id: item_id)
    #配送先の情報を保存
    Destination.create(post_number: post_number, prifecture_id: prifecture_id, city: city, address: address, building: building, phone_number: phone_number, order_id: order_id)
end