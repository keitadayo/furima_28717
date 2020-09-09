FactoryBot.define do
  factory :order_shipping_address do
    postal_code     { '123-1111' }
    prefecture_id   { Faker::Number.between(from: 2, to: 48) }
    city            { '江別市' }
    address         { '大麻' }
    building        { '1-1-1' }
    phone           { Faker::Number.number(digits: 10) }
    token           { 'sdfsdf' }
  end
end
