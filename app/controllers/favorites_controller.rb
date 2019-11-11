class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.create(article_id: params[:article_id])
    redirect_to articles_url, notice: "#{favorite.article.user.name}さんの投稿をお気に入り登録しました"
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to articles_url, notice: "#{favorite.article.user.name}さんの投稿をお気に入り解除しました"
  end
end
