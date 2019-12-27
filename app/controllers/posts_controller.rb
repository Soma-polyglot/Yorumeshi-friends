class PostsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @posts = Post.includes(:user).order("created_at DESC").page(params[:page]).per(5)
    @counter = Post.count
  end

  def new
    @post = Post.new
  end
  
  def create
    Post.create(post_params)
    redirect_to root_path
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to root_path
  end

  def join
    @post = Post.find(params[:id])
    @product.update(status: 1)
    redirect_to root_path
  end

  private
  def post_params
    params.require(:post).permit(:date, :prefecture_id, :venue , :count_id, :genre_id, :title, :comment).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
  
end
