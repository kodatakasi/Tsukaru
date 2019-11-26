require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @article = FactoryBot.create(:article, user_id: @user.id)
    @onsen = FactoryBot.create(:onsen, article_id: @article.id)
  end

  it "contentにコメントが空ならバリデーションが通らない" do
    comment = Comment.create(content: "", user_id: @user.id, article_id: @article.id)
    expect(comment).not_to be_valid
  end

  it "contentにコメントが入っていればバリデーションが通る" do
    comment = Comment.create(content: "あああ", user_id: @user.id, article_id: @article.id)
    expect(comment).to be_valid
  end
end
