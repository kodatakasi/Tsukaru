class UsersController < ApplicationController
  before_action :set_user, only: %i(show edit update destroy)

  def index
    @users = User.all
  end

  def show
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
    params.require(:user).permit(:name, :email, :image)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
