FactoryBot.define do
  factory :company do

    company_name          { "株式会社meta" }
    category_id           { "2" }
    prefecture_id         { "2" }
    city                  { "世田谷区" }
    house_number          { "１丁目１番地" }
    building              { "赤坂ビル２階" }
    email                 { Faker::Internet.free_email }
    password              { Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1) }
    password_confirmation { password }
    first_name            { "アンジェリカ" }
    last_name             { "道端" }
  end
end
