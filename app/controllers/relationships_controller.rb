class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  respond_to? :js
  def create
    @user = User.find(params[:relationship][:followed_id])
    current_user.follow!(@user)
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow!(@user)
  end
end
