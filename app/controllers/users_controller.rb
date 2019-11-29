class UsersController < ApplicationController
  before_action :set_user, only: %i(show edit update destroy)
  before_action :authenticate_user!, only: %i(edit update destroy)
  before_action :correct_user, only: %i(edit update destroy)

  def index
    @users = User.page(params[:page])
  end

  def show
    @articles = @user.articles
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path, notice: 'プロフィール編集しました！'
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to articles_path, notice: 'ユーザー情報を削除しました！'
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :image, :profile)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
