FactoryBot.define do
  factory :onsen do
    name { "name" }
    prefectures { "北海道" }
    quality { "アルカリ単純泉" }
    infomation { "infomation" }
  end

  factory :second_onsen, class: Onsen do
    name { "name" }
    prefectures { "神奈川" }
    quality { "単純泉" }
    infomation { "infomation" }
  end
end
