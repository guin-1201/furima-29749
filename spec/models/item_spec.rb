require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/img_5782.jpg')
  end

  describe '商品出品機能' do

    context '出品に失敗したとき' do

      it 'imageが空だと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'productが空だと出品できない' do
        @item.product = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product can't be blank")
      end
      it 'descriptionが空だと出品できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'category_idが空だと出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'status_idが空だと出品できない' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it 'shipping_charge_class_idが空だと出品できない' do
        @item.shipping_charge_class_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge class can't be blank")
      end
      it 'ship_address_idが空だと出品できない' do
        @item.ship_address_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship address can't be blank")
      end
      it 'ship_date_class_idが空だと出品できない' do
        @item.ship_date_class_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship date class can't be blank")
      end
      it 'priceが空だと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが9,999,999円を超過すると保存できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
      it 'priceが299円以下だと保存できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
      it '販売価格は半角数字でないと保存できない' do
        @item.price = "aaaa"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
      it 'category_idが0だと保存できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 0")
      end
      it 'status_idが0だと保存できない' do
        @item.status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 0")
      end
      it 'shipping_charge_class_idが0だと保存できない' do
        @item.shipping_charge_class_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge class must be other than 0")
      end
      it 'ship_address_idが0だと保存できない' do
        @item.ship_address_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship address must be other than 0")
      end
      it 'ship_date_class_idが0だと保存できない' do
        @item.ship_date_class_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship date class must be other than 0")
      end

    end


    context '出品に成功したとき' do


      it 'image,product,description,category_id,status_id,shipping_charge_class_id,ship_address_id,ship_date_class_id,priceが存在すれば出品できる' do
        expect(@item).to be_valid
      end
      it '販売価格は半角数字で保存できる' do
        @item.price = 3000
        expect(@item).to be_valid
      end

    end

  end
end

# - ***000###ログインしているユーザーだけが、出品ページへ遷移できること
# - ***000###画像は1枚必須であること(ActiveStorageを使用すること)
# - ***000###商品名が必須であること
# - ***000###商品の説明が必須であること
# - ***000###カテゴリーの情報が必須であること
# - ***000###商品の状態についての情報が必須であること
# - ***000###配送料の負担についての情報が必須であること
# - ***000###発送元の地域についての情報が必須であること
# - ***000###発送までの日数についての情報が必須であること
# - ***000###価格についての情報が必須であること
# - ***000###価格の範囲が、¥300~¥9,999,999の間であること
# - ***000###販売価格は半角数字のみ保存可能であること
# - 入力された販売価格によって、非同期的に販売手数料や販売利益が変わること(JavaScriptを使用して実装すること)
# - エラーハンドリングができていること（適切では無い値が入力された場合、情報は保存されず、エラーメッセージを出力させる）