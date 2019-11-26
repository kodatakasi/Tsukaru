FactoryBot.define do
  factory :user do
    name { "test_user" }
    email { "test@example.com" }
    password { "password" }
  end

  factory :second_user, class: User do
    name { "second_user" }
    email { "second@example.com" }
    password { "password" }
  end

  factory :third_user, class: User do
    name { "thrid_user" }
    email { "thrid@example.com" }
    password { "password" }
  end
end
