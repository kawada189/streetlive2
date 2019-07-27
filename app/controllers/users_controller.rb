class UsersController < ApplicationController
  def index
  end

  def show
   @current_user = User.find_by(id: session[:user_id])
   @posts = @current_user.posts
  end

 
end
