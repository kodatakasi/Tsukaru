require 'rails_helper'

RSpec.describe Onsen, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @article = FactoryBot.create(:article, user_id: @user.id)
  end

  it "名前が空ならバリデーションが通らない" do
    onsen = Onsen.create(name: "", prefectures: "神奈川", quality: "硫黄泉", infomation: "infomation", article_id: @article.id)
    expect(onsen).not_to be_valid
  end

  it "地域が空ならバリデーションが通らない" do
    onsen = Onsen.create(name: "鬼怒川温泉", prefectures: "", quality: "硫黄泉", infomation: "infomation", article_id: @article.id)
    expect(onsen).not_to be_valid
  end

  it "泉質が空ならバリデーションが通らない" do
    onsen = Onsen.create(name: "鬼怒川温泉", prefectures: "栃木", quality: "", infomation: "infomation", article_id: @article.id)
    expect(onsen).not_to be_valid
  end

  it "名前、地域、泉質が入っていればバリデーションが通る" do
    onsen = Onsen.create(name: "箱根温泉", prefectures: "神奈川", quality: "硫黄泉", infomation: "", article_id: @article.id)
    expect(onsen).to be_valid
  end
end
