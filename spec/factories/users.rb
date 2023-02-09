FactoryBot.define do
  factory :user do

    nickname              { "アンジー" }
    email                 { Faker::Internet.free_email }
    password              { Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1) }
    password_confirmation { password }
    first_name            { "アンジェリカ" }
    last_name             { "道端" }
  end
end
