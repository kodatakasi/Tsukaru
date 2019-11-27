require 'rails_helper'

RSpec.describe User, type: :system do
  before do
    user = FactoryBot.create(:user)
    second_user = FactoryBot.create(:second_user)
  end
  
  describe '新規登録画面' do
    context 'ユーザーが新規登録した場合' do
      it '自分の名前が表示される' do
        visit root_path
        click_link '新規登録'
        fill_in('user_name', with: 'ゆうたろう')
        fill_in('user_email', with: 'yutaro@dic.com')
        fill_in('user_password', with: 'password')
        fill_in('user_password_confirmation', with: 'password')
        click_button 'Sign up'
        expect(page).to have_content 'ゆうたろう'
      end
    end
  end

  describe 'ログイン画面' do
    context 'ユーザーがログインした場合' do
      it '自分の名前が表示される'do
        visit root_path
        click_link 'ログイン'
        fill_in('user_email', with: 'test@example.com')
        fill_in('user_password', with: 'password')
        click_button 'Log in'
        expect(page).to have_content 'test_user'
      end
      it '自分のプロフィールを変更できる' do
        visit root_path
        click_link 'ログイン'
        fill_in('user_email', with: 'test@example.com')
        fill_in('user_password', with: 'password')
        click_button 'Log in'
        click_link 'プロフィール編集'
        fill_in('user_name', with: 'change_name')
        fill_in('user_email', with: 'change@example.com')
        fill_in('user_profile', with: 'example')
        click_button '更新する'
        expect(page).to have_no_content 'test_user'
        expect(page).to have_content 'プロフィール編集しました！'
        expect(page).to have_content 'change_name'
      end
      it 'プロフィール画面から削除できる' do
        visit root_path
        click_link 'ログイン'
        fill_in('user_email', with: 'test@example.com')
        fill_in('user_password', with: 'password')
        click_button 'Log in'
        click_link 'プロフィール編集'
        click_link 'ユーザー情報を削除する'
        sleep 1
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content 'ユーザー情報を削除しました！'
        expect(page).to have_no_content 'test_user'
      end
    end
  end

  describe 'ログインした場合' do
    context 'ユーザー一覧画面から' do
      it '他のユーザーをフォローできる' do
        visit root_path
        click_link 'ログイン'
        fill_in('user_email', with: 'test@example.com')
        fill_in('user_password', with: 'password')
        click_button 'Log in'
        click_link 'ユーザー一覧'
        click_button 'フォロー', match: :first
        expect(page).to have_button 'つながりを解除'
      end
    end
  end

  describe 'facebookでログインした場合' do
    it 'ログインできる' do
      visit root_path
      click_link 'ログイン'
      click_link 'Sign in with Facebook'
      expect(page).to have_content 'facebook アカウントによる認証に成功しました。'
    end
  end

  describe 'lineでログインした場合' do
    it 'ログインできる' do
      visit root_path
      click_link 'ログイン'
      click_link 'Sign in with Line'
      expect(page).to have_content 'line アカウントによる認証に成功しました。'
    end
  end
end