class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, except: :new

  def new
  end

  def create
    if params[:comment][:post_id].present?
      @post = Post.find_by(id: params[:comment][:post_id])
      @comment = @post.comments.create(body: params[:comment][:body])
    else
      @comment = Comment.new(comment_params)
    end
    if @comment.save
      @comment.update_attribute(:user_id, current_user.id)
      @comment.notifications.create({user_id: current_user.id, post_id: @post.id})
      # redirect_to :back
      respond_to do |format|
        format.html { redirect_to :back }
        format.js
      end
    else
      render ""
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    if @comment.present?
      @comment.destroy
    end
    redirect_to :back
  end

  private

  def set_comment
    @comment = Comment.find_by(id: params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end

end
