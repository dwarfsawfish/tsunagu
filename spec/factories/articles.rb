FactoryBot.define do
  factory :article do
    title                { Faker::Book.title }
    content              { Faker::Lorem.paragraph(sentence_count: 7) }
    sorting_id           { "2" }

    association :user

  end
end
