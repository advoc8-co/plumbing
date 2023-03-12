FactoryBot.define do
  factory :project do
    # company comes from Current.user
    name { Faker::Company.bs }
  end
end
