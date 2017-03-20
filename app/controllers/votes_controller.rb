class VotesController < ApplicationController
  def create
    @post = Post.find_by(id: params[:vote][:post_id])
    @user = User.find_by(id: params[:vote][:user_id])
    @user.like_post(@post, @user)
    
    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end
  end

  def destroy
    @vote = Vote.find_by(id: params[:id])
    @post = Post.find_by(id: @vote.post_id)
    current_user.unlike_post(@post)
    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end
  end
end
