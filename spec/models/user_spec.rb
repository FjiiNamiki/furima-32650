require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、名前、誕生日が存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上で、半角英数字混合ならば登録できる' do
        @user.password = 'abc133'
        @user.password_confirmation = 'abc133'
        expect(@user).to be_valid
      end
      it 'lastname_kanjiとfirstname_kanjiが全角（漢字・ひらがな・カタカナ）で、lastname_kanaとfirstname_kanaが全角カタカナでの入力ならば登録できる' do
        @user.lastname_kanji = '前原'
        @user.firstname_kanji = '知佳'
        @user.lastname_kana = 'マエハラ'
        @user.firstname_kana = 'チカ'
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        binding.pry
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'emmaemma'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Email is invalid'
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'passwordが6文字以上でないと登録できない' do
        @user.password = 'ab12'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
      end
      it 'passwordが半角英数字混合での入力でないと登録できない' do
        @user.password = 'aaaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is invalid'
      end
      it 'passwordとpassword_confirmationが一致しないと登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '名字が空では登録できない' do
        @user.lastname_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Lastname kanji can't be blank"
      end
      it '名字が全角（漢字・ひらがな・カタカナ）での入力でないと登録できない' do
        @user.lastname_kanji = 'namiki'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Lastname kanji is invalid'
      end
      it '名前が空では登録できない' do
        @user.firstname_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Firstname kanji can't be blank"
      end
      it '名字が全角（漢字・ひらがな・カタカナ）での入力でないと登録できない' do
        @user.firstname_kanji = 'namiki'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Firstname kanji is invalid'
      end
      it '名字（カナ）が空では登録できない' do
        @user.lastname_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Lastname kana can't be blank"
      end
      it '名字（カナ）が全角カタカナでの入力でないと登録できない' do
        @user.lastname_kana = 'なみき'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Lastname kana is invalid'
      end
      it '名前（カナ）が空では登録できない' do
        @user.firstname_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Firstname kana can't be blank"
      end
      it '名字（カナ）が全角カタカナでの入力でないと登録できない' do
        @user.firstname_kana = 'なみき'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Firstname kana is invalid'
      end
      it '誕生日が空では登録できない' do
        @user.birthday = ''
        @user.valid?
        # binding.pry
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
    end
  end
end
