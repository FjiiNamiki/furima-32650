FactoryBot.define do
  factory :item do
    title            { 'オムライス' }
    discription      { '美味しいオムライス' }
    category_id      { 2 }
    condition_id     { 2 }
    shipping_pay_id  { 2 }
    prefecture_id    { 30 }
    transport_day_id { 2 }
    price            { 500 }
    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/testimg.png'), filename: 'testimg.png')
    end
  end
end
