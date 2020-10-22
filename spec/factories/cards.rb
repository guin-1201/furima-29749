FactoryBot.define do
  factory :card do
    card_token        { "tok_a1a1a1a1a1a1a1a1a1a1a1a1a1a1" }
    customer_token    { "cus_b2b2b2b2b2b2b2b2b2b2b2b2b2b2" }
    association :user   # users.rbのFactoryBotとアソシエーションがある
  end
end
