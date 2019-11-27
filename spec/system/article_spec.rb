require 'rails_helper'

RSpec.describe Article, type: :system do
  before do
    user = FactoryBot.create(:user)
    article = FactoryBot.create(:article, user: user)
    second_article = FactoryBot.create(:second_article, user: user)
    onsen = FactoryBot.create(:onsen, article: article)
    second_onsen = FactoryBot.create(:second_onsen, article: second_article)
    label = FactoryBot.create(:label)
    visit root_path
    click_link 'ログイン'
    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "password"
    click_button "Log in"
  end

  describe '投稿一覧画面' do
    context 'ログインした場合' do
      it '作成済みの投稿が表示されること' do
        expect(page).to have_content 'MyString'
    end
      it '記事の内容で検索ができる' do
        fill_in('q_content_cont', with: 'SecondContent')
        click_button 'search'
        expect(page).to have_no_content 'MyString'
        expect(page).to have_content 'SecondTitle'
      end
    end
  end

  describe '投稿登録画面' do
    it '温泉を検索して記事を投稿しようの画面に遷移する' do
      click_link '新規投稿'
      expect(page).to have_content '温泉を検索して記事を投稿しよう'
    end
    it '温泉を選択して温泉一覧に画面遷移する' do
      click_link '新規投稿'
      select('北海道', from: 'prefectures')
      select('単純温泉', from: 'number')
      click_button 'search-onsen-button'
      expect(page).to have_content '白滝温泉'
    end
    it '温泉一覧画面から記事投稿画面に遷移できる' do
      click_link '新規投稿'
      select('北海道', from: 'prefectures')
      select('単純温泉', from: 'number')
      click_button 'search-onsen-button'
      click_button 'create', match: :first
      expect(page).to have_button '投稿する'
    end
    it "記事投稿画面でタイトルと内容を入れて投稿できる" do
      click_link '新規投稿'
      select('沖縄', from: 'prefectures')
      select('絞り込まない', from: 'number')
      click_button 'search-onsen-button'
      click_button 'create', match: :first
      fill_in('タイトル', with: 'okinawa')
      fill_in('内容', with: 'シーサー')
      check('水風呂')
      click_button '投稿する'
      expect(page).to have_content '投稿しました！'
    end
  end

  describe '投稿詳細画面' do
    it '該当投稿の内容が表示されたページに遷移すること' do
      click_link '記事を読む', match: :first
      expect(page).to have_content 'SecondContent'
    end
    it '投稿した内容の編集ができる' do
      click_link '編集する', match: :first
      fill_in('article_titile', with: 'change')
      click_button '投稿する'
      expect(page).to have_content '編集しました！'
      expect(page).to have_content 'change'
    end
    it '投稿した記事の削除ができる' do
      click_link '編集する', match: :first

    end
    it 'お気に入り登録できる' do
      click_link '記事を読む', match: :first
      click_link 'お気に入り登録する'
      expect(page).to have_content 'お気に入り登録しました'
    end
    it 'お気に入りした記事を解除できる' do
      click_link '記事を読む', match: :first
      click_link 'お気に入り登録する'
      click_link '記事を読む', match: :first
      click_link 'お気に入り解除する'
      expect(page).to have_content 'お気に入り解除しました'
    end
  end
end