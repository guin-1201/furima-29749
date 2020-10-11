FactoryBot.define do
  factory :item do
    product                    { "egg" }
    description                {Faker::Lorem.sentence}
    category_id                { 1 }
    status_id                  { 2 }
    shipping_charge_class_id   { 1 }
    ship_address_id            { 2 }
    ship_date_class_id         { 1 }
    price                      { 1000 }

    association :user   # users.rbのFactoryBotとアソシエーションがある

  end
end