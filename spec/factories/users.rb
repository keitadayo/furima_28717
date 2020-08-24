FactoryBot.define do
  factory :user do
    password = Faker::Internet.password(min_length: 6, mix_case: true)
    nickname              {Faker::Name.last_name}
    email                 {Faker::Internet.free_email}
    password              {password}
    password_confirmation {password}
    first_name            {"やまだ"}
    last_name             {"たろう"}
    first_name_kana       {"ヤマダ"}
    last_name_kana        {"タロウ"}
    birthday              {Faker::Date.birthday}
  end
end

