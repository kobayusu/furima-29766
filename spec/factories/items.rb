FactoryBot.define do
  factory :item do
    name { 'hoge' }
    explanation { Faker::Lorem.sentence }
    category_id { 2 }
    condition_id { 2 }
    postage_id { 2 }
    shipping_day_id { 2 }
    prefecture_id {2}
    price {'9999'}
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpeg'), filename: 'test_image.jpeg')
    end
  end
end
