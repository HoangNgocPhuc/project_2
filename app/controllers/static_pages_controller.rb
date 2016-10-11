class StaticPagesController < ApplicationController
  def home
    if !user_signed_in?
      flash[:notice] = "ban phai dang nhap"
      redirect_to "/users/sign_in"
    else
      @categories = Category.all
      @post = current_user.posts.new    
      @posts = Post.all.order(id: :desc).paginate(page: params[:page], per_page: 6)
    end
  end

  def contact
  end
end
