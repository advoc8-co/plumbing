FactoryBot.define do
  factory :audit_log do
    model_class { "Post" }
    action { "create" }
    changelog { "-" }
    company
    user
  end
end
