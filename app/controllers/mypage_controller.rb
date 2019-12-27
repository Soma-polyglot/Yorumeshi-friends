class MypageController < ApplicationController
  def show
    @user = User.find(params[:id])
    @post = Post.find(params[:id])
    @posts = @user.posts
  end
end
