require 'rails_helper'

RSpec.describe Relationship, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @second_user = FactoryBot.create(:second_user)
    @third_user = FactoryBot.create(:third_user)
    @relationship = Relationship.create(follower_id: @user.id, followed_id: @second_user.id)
  end

  it "別のユーザーをフォローできる" do
    relationship = Relationship.create(follower_id: @user.id, followed_id: @third_user.id)
    expect(relationship).to be_valid
  end

  it "同じユーザーをフォローできない" do
    relationship = Relationship.create(follower_id: @user.id, followed_id: @second_user.id)
    expect(relationship).not_to be_valid
  end
end
