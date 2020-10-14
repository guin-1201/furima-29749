require 'rails_helper'
describe Address do
  before do
    @address = FactoryBot.build(:address)
  end

  describe '住所登録' do

    context '住所登録がうまくいくとき' do

      it 'postal_code,prefecture_id,city,house_number,building_name,phoneが存在すれば出品できる' do
        expect(@address).to be_valid
      end

    end

    context '住所登録に失敗したとき' do

      it 'postal_codeが空だと住所登録できない' do
        @address.postal_code = ''
        @address.valid?
      end

      it 'cityが空だと住所登録できない' do
        @address.city = ''
        @address.valid?
      end

      it 'house_numberが空だと住所登録できない' do
        @address.house_number = ''
        @address.valid?
      end

      it 'building_nameが空だと住所登録できない' do
        @address.building_name = ''
        @address.valid?
      end

      it 'phoneが空だと住所登録できない' do
        @address.phone = ''
        @address.valid?
      end

      it 'phoneにハイフンが入ると住所登録できない' do
        @address.phone = 03-1234-5678
        @address.valid?
      end

      it 'phoneは11文字以内でないと住所登録できない' do
        @address.phone = 123456789012
        @address.valid?
      end

    end


  end