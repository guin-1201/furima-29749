require 'rails_helper'

RSpec.describe Purchase, type: :model do
  before do
    @order = FactoryBot.build(:purchase)
  end

  it "tokenがあれば保存ができること" do
    expect(@order).to be_valid
  end

  it "tokenが空では登録できないこと" do
    @order.token = nil
    @order.valid?
    #binding .pry
    #expect(@order.errors.full_messages).to include("Token can't be blank")
  end


end