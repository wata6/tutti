class PostsController < ApplicationController
  before_action :require_user_logged_in
  
  def index
    if logged_in?
      @posts = current_user.posts.order(id: :desc).page(params[:page])
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
  end
  
  private

  def post_params
    params.require(:post).permit(:title,:region,:instrument_requirement,:content)
  end
end
