class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @post = Post.find(params[:id])
    @posts = @user.posts
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    current_user.update(user_params)
    redirect_to user_path
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :profile, :image)
  end
end
