FactoryBot.define do
  factory :item do
    name            { Faker::Name.name }
    text            { Faker::Lorem.sentence }
    category_id     { Faker::Number.between(from: 2, to: 11) }
    state_id        { Faker::Number.between(from: 2, to: 6) }
    prefecture_id   { Faker::Number.between(from: 2, to: 48) }
    shipping_fee_id { Faker::Number.between(from: 2, to: 3) }
    day_id          { Faker::Number.between(from: 2, to: 4) }
    price           { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user
  end
end
