require 'rails_helper'

RSpec.describe Article, type: :model do
  before do
    @user = User.create(
                    name: 'test_user',
                   email: 'test@example.com',
                password: 'password',
    )
  end
  it "titleが空ならバリデーションが通らない" do
    article = Article.new(title: '', content: '失敗テスト', user_id: @user.id)
    expect(article).not_to be_valid
  end

  it "contentが空ならバリデーションが通らない" do
    article = Article.new(title: '温泉行った', content: '', user_id: @user.id)
    expect(article).not_to be_valid
  end

  it "titleとcontentに内容が記載されていればバリデーションが通る" do
    article = Article.new(title: '温泉行った', content: 'テスト成功', user_id: @user.id)
    expect(article).to be_valid
  end
end
