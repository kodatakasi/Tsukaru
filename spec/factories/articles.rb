FactoryBot.define do
  factory :article do
    title { "MyString" }
    content { "MyText" }
  end

  factory :second_article, class: Article do
    title { "MyString2" }
    content { "MyText2" }
  end
end
