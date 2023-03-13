FactoryBot.define do
  factory :stakeholder do
    name { Faker::Name.first_name }
  end
end
