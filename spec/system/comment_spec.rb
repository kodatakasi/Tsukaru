require 'rails_helper'

RSpec.describe Comment, type: :system do
  before do
    user = FactoryBot.create(:user)
    article = FactoryBot.create(:article, user: user)
    onsen = FactoryBot.create(:onsen, article: article)
    label = FactoryBot.create(:label)
    visit root_path
    click_link 'ログイン'
    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "password"
    click_button "Log in"
  end
  
  describe 'ログインすると記事詳細画面で' do
    it 'コメントが投稿できる' do
      click_link '記事を読む'
      fill_in('comment_content', with: 'test_comment')
      click_button 'コメントする'
      expect(page).to have_content 'test_comment'
    end
    it 'ログアウトするとコメントできない' do
      click_link 'ログアウト'
      click_link '記事を読む'
      expect(page).to have_no_button 'コメントする'
    end
    it '自分の投稿を削除できる' do
      click_link '記事を読む'
      fill_in('comment_content', with: 'test_comment')
      click_button 'コメントする'
      click_link '削除'
      expect(page).to have_no_content 'test_comment'
    end
    it '自分の投稿を編集できる' do
      click_link '記事を読む'
      fill_in('comment_content', with: 'test_comment')
      click_button 'コメントする'
      click_link '編集'
      expect(page).to have_button '編集する'
      fill_in('edit_comment', with: 'bbbb')
      click_button '編集する'
      expect(page).to have_content 'bbbb'
    end
  end
end