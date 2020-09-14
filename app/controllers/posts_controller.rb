class PostsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  
  def index
    if logged_in?
      @posts = Post.order(id: :desc).page(params[:page])
    end
  end

  def new
    if logged_in?
      @post = current_user.posts.build  # form_with 用
    end
  end

  def create
    @post = current_user.posts.build(post_params)
    
    if @post.save
      flash[:success] = '投稿しました。'
      redirect_to posts_path
 
    else
      @posts = current_user.posts.order(id: :desc).page(params[:page])
      flash.now[:danger] = '投稿に失敗しました。'
      render :new
    end
  end

  def destroy
    @post.destroy
    flash[:success] = 'メッセージを削除しました。'
    redirect_back(fallback_location: posts_path)
  end
  
  private

  def post_params
    params.require(:post).permit(:title,:region,:instrument_requirement,:content)
  end
  
  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
    unless @post
      redirect_to posts_path
    end
  end
end
