
FactoryBot.define do
  factory :order_destination do
    token                          { 'tok_abcdefghijk00000000000000000' }
    post_number                    { '123-1234' }
    prefecture_id                  { 2 }
    city                           { '札幌市' }
    address                        { '1-1-1' }
    building                       { 'ビル' }
    phone_number                   { '09012345678' }

    association :user
    association :item
  end
end