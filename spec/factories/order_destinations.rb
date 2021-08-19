FactoryBot.define do
  factory :order_destination do
    zipcode        { '123-4567' }
    prefecture_id  { 3 }
    city           { '前原市' }
    adress         { '1-1-1' }
    building       { '前原ビルヂング' }
    phonenumber    { '08012345678' }
    # association :user
  end
end
