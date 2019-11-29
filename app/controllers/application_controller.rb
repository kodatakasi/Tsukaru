class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search


def set_search
  @search = Article.ransack(params[:q])
  @search.sorts = "created_at desc" if @search.sorts.empty?
  @search_articles = @search.result.page(params[:page])
end

def correct_user
  @user = User.find(params[:id])
  unless @user == current_user
    redirect_to(root_path)
  end
end

def author
  @article = Article.find(params[:id])
  unless @article.user_id == current_user.id
    redirect_to(root_path)
  end
end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end