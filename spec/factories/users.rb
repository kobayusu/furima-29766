FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.free_email }
    password { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name { '太郎' }
    family_name { '田中' }
    family_kana { 'タナカ' }
    first_kana { 'タロウ' }
    birth_day {Faker::Date.birthday(min_age: 18, max_age: 65)}
  end
end
