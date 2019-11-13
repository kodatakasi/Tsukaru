FactoryBot.define do
  factory :comment do
    content { "MyText" }
    user { nil }
    article { nil }
  end
end
