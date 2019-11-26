require 'rails_helper'

RSpec.describe Favorite, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @article = FactoryBot.create(:article, user_id: @user.id)
    @second_article = FactoryBot.create(:second_article, user_id: @user.id)
    @onsen = FactoryBot.create(:onsen, article_id: @article.id)
    @favorite = Favorite.create(user_id: @user.id, article_id: @article.id)
  end

  it "新しい投稿をお気に入りできる" do
    favorite = Favorite.new(user_id: @user.id, article_id: @second_article.id)
    expect(favorite).to be_valid
  end

  it "複数の投稿をお気に入りできる" do
    favorite = Favorite.create(user_id: @user.id, article_id: @second_article.id)
    expect(favorite).to be_valid
  end

  it "user_idが空だとバリデーションが通らない" do
    favorite = Favorite.create(user_id: "", article_id: @article.id)
    expect(favorite).not_to be_valid
  end

  it "article_idが空だとバリデーションが通らない" do
    favorite = Favorite.create(user_id: @user.id, article_id: "")
    expect(favorite).not_to be_valid
  end

  it "同じ投稿をお気に入りしようとするとバリデーションが通らない" do
    favorite = Favorite.create(user_id: @user.id, article_id: @article.id)
    expect(favorite).not_to be_valid
  end
end
