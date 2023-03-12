FactoryBot.define do
  factory :post do
    user
    # company comes from Current.user
    title { Faker::Lorem.words(number: 4) }
    body { Faker::Lorem.paragraphs(number: 3) }
  end
end
