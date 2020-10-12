require 'rails_helper'

RSpec.describe OrderDestination, type: :model do
  before do
    # 出品者
    @seller = FactoryBot.create(:user)
    # 購入者
    @buyer = FactoryBot.create(:user)
    # 商品を生成
    @item = FactoryBot.create(:item, user_id: @seller.id)
    # 購入に必要なデータ
    @order_destination = FactoryBot.build(:order_destination, user_id: @buyer.id, item_id: @item.id)
    sleep(3)
  end

  describe '商品購入機能' do
    context '商品購入がうまくいく時' do
      it 'すべての値が正しく入力されていれば購入できること' do
        expect( @order_destination).to be_valid
      end
    end
  end

  context '商品購入がうまくいかない時' do
    it 'tokenが空では購入できないこと' do
       @order_destination.token = nil
       @order_destination.valid?
      expect( @order_destination.errors.full_messages).to include("Token can't be blank")
    end

    it 'postnumberが空では購入できないこと' do
       @order_destination.post_number = nil
       @order_destination.valid?
      expect( @order_destination.errors.full_messages).to include("Post number can't be blank")
    end

    it 'prefecture_idが--だと購入できないこと' do
       @order_destination.prefecture_id = 1
       @order_destination.valid?
      expect( @order_destination.errors.full_messages).to include("Prefecture 該当するものを選んでください")
    end

    it 'cityが空では購入できないこと' do
       @order_destination.city = nil
       @order_destination.valid?
      expect( @order_destination.errors.full_messages).to include("City can't be blank")
    end

    it 'addressが空では購入できないこと' do
       @order_destination.address = nil
       @order_destination.valid?
      expect( @order_destination.errors.full_messages).to include("Address can't be blank")
    end

    it 'buildingが空でも購入できる' do
       @order_destination.building = nil
       @order_destination.valid?
      expect( @order_destination).to be_valid
    end

    it 'phone_numberが空では購入できないこと' do
       @order_destination.phone_number = nil
       @order_destination.valid?
      expect( @order_destination.errors.full_messages).to include("Phone number can't be blank")
    end

    it 'post_numberが半角のハイフンを含んだ正しい形式でないと購入できないこと' do
       @order_destination.post_number = '1234567'
       @order_destination.valid?
      expect( @order_destination.errors.full_messages).to include('Post number 必ず（-）ハイフンを間に挟んでください')
    end

    it 'phone_numberが11桁以上では購入できないこと' do
       @order_destination.phone_number = '123456789012'
       @order_destination.valid?
      expect( @order_destination.errors.full_messages).to include('Phone number is invalid')
    end
  end
end
