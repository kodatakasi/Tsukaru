class UsersController < ApplicationController
  before_action :set_user
  def show
  end

  def edit
  end

  def update
    if @user.update
    else
      render :show
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
