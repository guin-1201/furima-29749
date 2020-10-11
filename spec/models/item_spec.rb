require 'rails_helper'

RSpec.describe Item, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end


# - ログインしているユーザーだけが、出品ページへ遷移できること
# - 画像は1枚必須であること(ActiveStorageを使用すること)
# - 商品名が必須であること
# - 商品の説明が必須であること
# - カテゴリーの情報が必須であること
# - 商品の状態についての情報が必須であること
# - 配送料の負担についての情報が必須であること
# - 発送元の地域についての情報が必須であること
# - 発送までの日数についての情報が必須であること
# - 価格についての情報が必須であること
# - 価格の範囲が、¥300~¥9,999,999の間であること
# - 販売価格は半角数字のみ保存可能であること
# - 入力された販売価格によって、非同期的に販売手数料や販売利益が変わること(JavaScriptを使用して実装すること)
# - エラーハンドリングができていること（適切では無い値が入力された場合、情報は保存されず、エラーメッセージを出力させる）