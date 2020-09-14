class FavoritesController < ApplicationController
  before_action :require_user_logged_in

  def create
    post = Post.find(params[:post_id])
    current_user.favorite(post)
    flash[:success] = '投稿をお気に入りにしました。'
    redirect_to posts_path
  end

  def destroy
    post = Post.find(params[:post_id])
    current_user.unfavorite(post)
    flash[:success] = 'お気に入りを取り消しました。'
    redirect_to  posts_path
  end
end
