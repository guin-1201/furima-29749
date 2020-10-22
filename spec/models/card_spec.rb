require 'rails_helper'

RSpec.describe Card, type: :model do

  before do
    @card = FactoryBot.build(:card)
  end

  describe 'カード情報登録' do

    context 'カード情報登録がうまくいくとき' do

      it "card_tokenとcustomer_tokenがあれば登録ができること" do
        expect(@card).to be_valid
      end

    end


    context 'カード情報登録に失敗したとき' do

      it 'card_tokenが空だと登録できない' do
        @card.card_token = nil
        @card.valid?
        expect(@card.errors.full_messages).to include("Card token カード情報を入力してください")
      end

      it 'customer_tokenが空だと登録できない' do
        @card.customer_token = nil
        @card.valid?
        expect(@card.errors.full_messages).to include("Customer token can't be blank")
      end

    end


  end





end
