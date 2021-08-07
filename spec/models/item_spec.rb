require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品出品' do
    context '商品出品できるとき' do
      it 'imageとtitleとdiscriptionとcategory_idととconditionとshipping_pay_idとprefecture_idとtransport_day_idとpriceが存在すれば登録できる' do
        expect(@item).to be_valid
      end
      it 'priceが半角数字で300以上9999999以下なら登録できる' do
        @item.price = 4000
        expect(@item).to be_valid
      end
    end
    context '商品出品できないとき' do
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it 'titleが空では登録できない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Title can't be blank"
      end
      it 'discriptionが空では登録できない' do
        @item.discription = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Discription can't be blank"
      end
      it 'categry_idが1では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Category must be other than 1"
      end
      it 'condition_idが1では登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition must be other than 1"
      end
      it 'shipping_pay_idが1では登録できない' do
        @item.shipping_pay_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping pay must be other than 1"
      end
      it 'prefecture_idが1では登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture must be other than 1"
      end
      it 'transport_day_idが1では登録できない' do
        @item.transport_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Transport day must be other than 1"
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it 'priceが全角数字では登録できない' do
        @item.price = '５００'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end
      it 'priceが300未満では登録できない' do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be greater than or equal to 300"
      end
      it 'priceが9999999より大きいと登録できない' do
        @item.price = 100000000000000000000
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be less than or equal to 9999999"
      end
    end
  end
end
