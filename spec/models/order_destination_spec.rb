require 'rails_helper'
RSpec.describe OrderDestination, type: :model do
  describe '商品購入機能' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_destination = FactoryBot.build(:order_destination, user_id: user.id, item_id: item.id)
      sleep 0.2
    end

    context '商品購入できるとき' do
      it 'tokenとzipcodeとcityとadressとbuildingとphonenumberが存在すれば登録できる' do
        expect(@order_destination).to be_valid
      end
      it 'buildingが空でも登録できる' do
        @order_destination.building = ''
        expect(@order_destination).to be_valid
      end
      it 'phonenumberが10桁でも登録できる' do
        @order_destination.phonenumber = '1234567890'
        expect(@order_destination).to be_valid
      end
    end
    context '商品購入できないとき' do
      it "tokenが空では登録できないこと" do
        @order_destination.token = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Token can't be blank")
      end
      it 'zipcodeが空では登録できない' do
        @order_destination.zipcode = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include "Zipcode can't be blank"
      end
      it 'zipcodeはハイフンがないと登録できない' do
        @order_destination.zipcode = '1234567'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include "Zipcode is invalid"
      end
      it 'prefecture_idが1では登録できない' do
        @order_destination.prefecture_id = 1
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include "Prefecture must be other than 1"
      end
      it 'cityが空では登録できない' do
        @order_destination.city = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include "City can't be blank"
      end
      it 'adressが空では登録できない' do
        @order_destination.adress = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include "Adress can't be blank"
      end
      it 'phonenumberが空では登録できない' do
        @order_destination.phonenumber = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include "Phonenumber can't be blank"
      end
      it 'phonenumberが12桁以上の数字では登録できない' do
        @order_destination.phonenumber = '111111111111'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include "Phonenumber is invalid"
      end
      it 'phonenumberが9桁以下の数字では登録できない' do
        @order_destination.phonenumber = '111111111'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include "Phonenumber is invalid"
      end
      it 'phonenumberが数字以外では登録できない' do
        @order_destination.phonenumber = 'ああ'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include "Phonenumber is invalid"
      end
      it 'userが紐づいていないと登録できない' do
        @order_destination.user_id = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include "User can't be blank"
      end
      it 'itemが紐づいていないと登録できない' do
        @order_destination.item_id = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include "Item can't be blank"
      end
    end
  end
end
