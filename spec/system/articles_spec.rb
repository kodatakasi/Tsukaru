require 'rails_helper'

RSpec.describe Article, type: :system do
  before do
    user = FactoryBot.create(:user)
    article = FactoryBot.create(:article, user: user)
    visit root_path
    click_link 'ログイン'
    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "password"
    click_button "Log in"
  end
  describe '投稿一覧画面' do
    context 'ログインした場合'
      it '作成済みの投稿が表示されること' do
      expect(page).to have_content 'MyString'
    end
  end

  describe '投稿登録画面' do
    context '必要項目を入力して、createボタンを押した場合' 
      it 'データが保存されること' do
        click_link '新規投稿'
        fill_in 'Title', with: 'test_title'
        fill_in 'Content', with: 'test_content'
        click_button 'Create Article'
        expect(page).to have_content 'test_title'
    end
  end

  describe '投稿詳細画面' do
     context '任意の投稿詳細画面に遷移した場合'
       it '該当投稿の内容が表示されたページに遷移すること' do
        click_link '詳細を確認する'
        expect(page).to have_content 'MyText'
     end
  end
end