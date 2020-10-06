require 'rails_helper'

RSpec.describe Item, type: :model do
  describe Item do
    before do
      @item = FactoryBot.build(:item)
    end

    describe '商品出品機能' do
      context '商品出品がうまくいくとき' do
        it 'name,explanation,price,postage_id,shipping_day_id,condition_id,category_id,prefecture_id,user_id,imageがあれば登録できる' do
          expect(@item).to be_valid
        end
      end

      context '商品出品ができないとき' do
        it '商品名が空だと出品できない' do
          @item.name = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end
        it '商品説明が空だと出品できない' do
          @item.explanation = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Explanation can't be blank")
        end
        it '販売価格が空だと出品できない' do
          @item.price = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end
        it 'postage_idが空だと出品できない' do
          @item.postage_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Postage can't be blank")
        end
        it 'shipping_day_idが空だと出品できない' do
          @item.shipping_day_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping day can't be blank")
        end
        it 'condition_idが空だと出品できない' do
          @item.condition_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Condition can't be blank")
        end
        it 'category_idが空だと出品できない' do
          @item.category_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Category can't be blank")
        end
        it 'prefecture_idが空だと出品できない' do
          @item.prefecture_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Prefecture can't be blank")
        end
        it 'imageが空だと出品できない' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end
        it '価格の範囲が300〜9,999,999の間でないと出品できない' do
          @item.price = '299', '10000000'
          @item.valid?
          expect(@item.errors.full_messages).to include('Price 300円〜9,999,999円で価格設定をしてください・半角で記入してください')
        end
        it '販売価格は半角のみ保存可能' do
          @item.price = '１０００'
          @item.valid?
          expect(@item.errors.full_messages).to include('Price 300円〜9,999,999円で価格設定をしてください・半角で記入してください')
        end
      end
    end
  end
end
