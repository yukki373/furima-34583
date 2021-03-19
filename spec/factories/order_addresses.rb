FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    shipping_area_id { 2 }
    municipality { 1 }
    address { '1-1' }
    building_name { '東京団地'}
    phone_number { '00000000000' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
