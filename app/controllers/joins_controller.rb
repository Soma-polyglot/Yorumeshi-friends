class JoinsController < ApplicationController
  def create
    join = Join.create(join_params)
    redirect_to "/posts/#{join.post.id}"
  end

  private
  def join_params
    params.require(:joins).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end
