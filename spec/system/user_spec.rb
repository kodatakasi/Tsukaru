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
end