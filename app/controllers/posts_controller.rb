class PostsController < ApplicationController
  # before_action :authenticate_user!

  def index
    @posts = Post.search(params[:search]).order("created_at DESC")
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to :back, notice: "The post #{@post.title} has been uploaded."
    else
      render "new"
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    respond_to do |format|
      if @post.update_attributes(post_params)
        format.html { redirect_to @post, notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    if @post.present?
      @post.destroy
    end
    redirect_to :back, notice:  "The post #{@post.title} has been deleted."
   end

  private

    def post_params
      params.require(:post).permit(:title, :attachment, :category_id, :image)
    end
end
