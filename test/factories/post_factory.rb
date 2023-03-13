FactoryBot.define do
  factory :post do
    user
    company
    title { Faker::Lorem.words(number: 4) }
    body { Faker::Lorem.paragraphs(number: 3) }
    project
  end
end
