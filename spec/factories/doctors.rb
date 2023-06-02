FactoryBot.define do
  factory :doctor do
    full_name { "John Doe" }
    phone { "1234567890" }
    role { "doctor" }
    password { "password" }
  end
end