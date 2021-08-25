FactoryBot.define do
  factory :order_destination do
    token          { "tok_abcdefghijk00000000000000000" }
    zipcode        { '123-4567' }
    prefecture_id  { 3 }
    city           { '前原市' }
    adress         { '1-1-1' }
    building       { '前原ビルヂング' }
    phonenumber    { '08012345678' }
    association :user
    association :item
  end
end
