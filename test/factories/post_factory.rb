FactoryBot.define do
  factory :post do
    company_user
    title { Faker::Lorem.words(number: 4) }
    body { Faker::Lorem.paragraphs(number: 3) }
    project

    after(:create) do |post|
      post.company = post.company_user.company
    end
  end
end
