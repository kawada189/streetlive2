class UsersController < ApplicationController
  
  def index
  end

  def show
   @user = User.find(params[:id])
   @posts = @user.posts.order(id: "DESC")
   @favorite_posts = @user.favorite_posts
  end

 
end
