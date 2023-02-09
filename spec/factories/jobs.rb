FactoryBot.define do
  factory :job do
    occupation_id            { "2" }
    status_id                { "2" }
    work                     { Faker::Lorem.paragraph(sentence_count: 7) }
    training                 { Faker::Lorem.paragraph(sentence_count: 7) }
    license                  { Faker::Lorem.paragraph(sentence_count: 7) }
    age                      { Faker::Lorem.sentence }
    work_area                { Faker::Lorem.sentence }
    salary                   { Faker::Lorem.sentence }
    trial_salary             { Faker::Lorem.sentence }
    time                     { Faker::Lorem.sentence }
    holiday                  { Faker::Lorem.sentence }
    benefit                  { Faker::Lorem.sentence }
    benefit_supplement       { Faker::Lorem.sentence }
    qualification            { Faker::Lorem.sentence }
    emvironment              { Faker::Lorem.paragraph(sentence_count: 7) }
    representative_message   { Faker::Lorem.paragraph(sentence_count: 7) }
    appeal                   { Faker::Lorem.sentence }

    association :company

    after(:build) do |job|
      job.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
