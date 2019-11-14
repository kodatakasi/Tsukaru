FactoryBot.define do
  factory :user do
    name { "test_user" }
    email { "test@example.com" }
    password { "password" }
  end
end
