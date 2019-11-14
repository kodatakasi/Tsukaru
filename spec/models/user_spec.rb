require 'rails_helper'

RSpec.describe User, type: :model do
  it "名前が空ならバリデーションが通らない" do
    user = User.new(name: '', email: 'a@example.com', password: 'password')
    expect(user).not_to be_valid
  end

  it "メールアドレスが空ならバリデーションが通らない" do
    user = User.new(name: 'name', email: '', password: 'password')
    expect(user).not_to be_valid
  end

  it "パスワードが空ならバリデーションが通らない" do
    user = User.new(name: 'name', email: 'a@example.com', password: '')
    expect(user).not_to be_valid
  end

  it "名前とメールアドレスとパスワードに内容が記載されていればバリデーションが通る" do
    user = User.new(name: 'name', email: 'a@example.com', password: 'password')
    expect(user).to be_valid
  end
end
