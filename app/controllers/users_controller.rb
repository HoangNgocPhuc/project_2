class UsersController < ApplicationController
  # before_action :authenticate_user!

  def index
    @users = User.search(params[:search])
  end

  def show
    @user = User.find_by(id: params[:id])
    @posts = @user.posts.order(id: :desc).paginate(page: params[:page], per_page: 6)
    @post = @user.posts.create
  end

  def destroy
    @user = User.find_by(id: params[:id])
    if @user.present?
      @user.destroy
    end
    redirect_to users_path, notice:  "The user has been deleted."
  end

end
