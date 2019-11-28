require 'faker'

30.times do
  User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: 'password',
    profile: Faker::Lorem.paragraph,
  )
end

30.times do |n|
  Article.create(
    title: Faker::ProgrammingLanguage.name,
    content: Faker::Lorem.paragraphs,
    user_id: "#{n}"
  )
end

30.times do |n|
  Onsen.create(
    name: Faker::App.name,
    prefectures: Faker::Nation.nationality,
    quality: Faker::Space.planet,
    infomation: Faker::Lorem.paragraphs,
    article_id: "#{n + 2}"
  )
end

10.times do
  Label.create(
    name: Faker::Color.color_name
  )
end

