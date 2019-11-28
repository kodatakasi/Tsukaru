class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search

def set_search
  @search = Article.ransack(params[:q])
  @search.sorts = "created_at desc" if @search.sorts.empty?
  @search_articles = @search.result.page(params[:page])
end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end