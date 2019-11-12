class UsersController < ApplicationController
  before_action :set_user, only: %i(show edit update)

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

  private
  def user_params
    params.require(:user).permit(:name, :email, :image)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
