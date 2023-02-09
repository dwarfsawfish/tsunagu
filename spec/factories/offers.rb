FactoryBot.define do
  factory :offer do
    first_name { "MyString" }
    last_name { "MyString" }
    email { "MyString" }
    age { 1 }
    postage_id { 1 }
    city { "MyString" }
    house_number { "MyString" }
    building { "MyString" }
    phone_number { "MyString" }
    academic_career { "MyString" }
    work_history { "MyText" }
    appeal { "MyText" }
    user_id { nil }
    job_id { nil }
  end
end
