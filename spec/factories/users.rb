FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 5)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    #password {password}
    password_confirmation {password}
    last_name             {"田中"}
    first_name            {"銀太"}
    last_name_kana        {"タナカ"}
    first_name_kana       {"ギンタ"}
    birthday              {Faker::Date.birthday}
  end
end
