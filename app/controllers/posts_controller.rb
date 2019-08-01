class PostsController < ApplicationController
  # before_action :authenticate, except: [:index]
  def index
    @posts = Post.search(params[:search]).order(id: "DESC")
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user

  end

  def new
    @post = Post.new 
  end

  def create
    @post = Post.new(post_params)  
    @post.user_id = current_user.id
    @post.save
    redirect_to root_path
  end

  def destroy
    @post = current_user.posts.find_by(id: params[:id])
    @post.destroy
    flash[:success] = "投稿を消しました。"
    redirect_to users_path
  end

  def map
    @marker_all = Post.all
  end

  private
  def post_params
    params.require(:post).permit(:title, :start_time, :contents,:place,:genre,:image,:lat,:lon) 
  end

end
