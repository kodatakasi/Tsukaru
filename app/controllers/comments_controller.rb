class CommentsController < ApplicationController
  before_action :set_article

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.build(comment_params)
    @comment.user_id = current_user.id

    respond_to do |format|
      if @comment.save
        format.js { render :index }
      else
        format.html { redirect_to article_path(@article), notice: '投稿できませんでした...' }
      end
    end
  end

  def show
    @comments = @article.comments
    @comment = @article.comment.build
  end

  def edit
    @comment = @article.comments.find(params[:id])
    respond_to do |format|
      @comment.update
    end

  end

  def update
    @comment = @article.comments.find(params[:id])
    respond_to do |format|
      if @comment.update(comment_params)
        format.js { render :index }
      else
        format.html { redirect_to article_path(@article), notice: '編集できませんでした...' }
      end
    end
  end

  def destroy
    @comment = @article.comments.find(params[:id])

    respond_to do |format|
      if current_user.id == @comment.user_id
        @comment.destroy
        format.js { render :index }
      else
        format.html { redirect_to article_path(@article), notice: '削除できませんでした...' }
      end
    end
  end

  private
  def set_article
    @article = Article.find(params[:article_id])
  end

  def comment_params
    params.require(:comment).permit(:article_id, :content)
  end
end
