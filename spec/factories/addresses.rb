FactoryBot.define do
  factory :address do
    product                    { "100-0005" }
    category_id                { 13 }
    city                       { "千代田区" }
    house_number               { "丸の内三丁目3番1号" }
    building_name              { "新東京ビル" }
    phone                      { "0312345678" }
  end
end
