class CommentsController < ApplicationController
  before_action :set_article

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.article_id = article.id
    
    if @comment.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    if current_user == @comment.user_id
      @comment = @article.comments.find(params[:id])
      @comment.destroy
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private
  def set_article
    @article = Article.find(params[:article_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
