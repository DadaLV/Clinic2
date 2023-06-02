FactoryBot.define do
  factory :patient do
    full_name { "Jane Smith" }
    phone { "1234567890" }
    password { "password" }
    role { "patient" }
  end
end