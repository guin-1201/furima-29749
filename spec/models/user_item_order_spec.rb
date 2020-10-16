require 'rails_helper'

RSpec.describe UserItemOrder, type: :model do
  before do
    @order = FactoryBot.build(:user_item_order)
  end


  describe '商品購入' do


    context '商品購入がうまくいくとき' do

      it "tokenがあれば保存ができること" do
        expect(@order).to be_valid
      end

      it 'postal_code,prefecture_id,city,house_number,building_name,phoneが存在すれば出品できる' do
        expect(@order).to be_valid
      end

      it 'phoneが11桁以内だと登録できる' do
        @order.phone = '0312345678'
        expect(@order).to be_valid
      end

    end


    context '商品登録に失敗したとき' do

      it "tokenが空では登録できないこと" do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end

      it 'postal_codeが空だと登録できない' do
        @order.postal_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code can't be blank")

      end

      it 'cityが空だと登録できない' do
        @order.city = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end

      it 'house_numberが空だと登録できない' do
        @order.house_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("House number can't be blank")
      end

      it 'phoneが空だと登録できない' do
        @order.phone = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone can't be blank")
      end

      it 'phoneにハイフンが入ると登録できない' do
        @order.phone = 03-1234-5678
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone 半角数字・ハイフンなし・11桁以内で入力してください")
      end

      it 'phoneが12桁以上だと登録できない' do
        @order.phone = '03123456789012'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone 半角数字・ハイフンなし・11桁以内で入力してください")
      end

    end

  end
end