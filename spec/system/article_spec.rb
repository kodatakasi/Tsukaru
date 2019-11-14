require 'rails_helper'

RSpec.describe Article, type: :system do
  describe '投稿覧画面' do
    context '投稿を作成した場合' do
      it '作成済みの投稿が表示されること' 
      article = FactoryBot.create(:article)
      visit articles_path
      expect(page).to have_content 'MyString'
    end
  end

  describe '投稿登録画面' do
    context '必要項目を入力して、createボタンを押した場合' do
      it 'データが保存されること'
    end
  end

  describe '投稿詳細画面' do
     context '任意の投稿詳細画面に遷移した場合' do
       it '該当投稿の内容が表示されたページに遷移すること' 
     end
  end
end