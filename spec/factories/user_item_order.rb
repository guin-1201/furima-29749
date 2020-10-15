FactoryBot.define do
  factory :user_item_order do
    token {"tok_abcdefghijk00000000000000000"}
    postal_code                    { "100-0005" }
    prefecture_id                { 13 }
    city                       { "千代田区丸の内" }
    house_number               { "三丁目3番1号" }
    building_name              { "新東京ビル" }
    phone                      { '0312345678' }
  end
end