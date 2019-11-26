require 'rails_helper'

RSpec.describe Label, type: :model do
  before do
  end
  it "nameが入っていればバリデーションが通る" do
    label = Label.create(name: "test")
    expect(label).to be_valid
  end
  
  it "nameが空だとバリデーションが通らない" do
    label = Label.create(name: "")
    expect(label).not_to be_valid
  end
end
