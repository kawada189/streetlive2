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
    if @post.save
      redirect_to root_path
    else 
      render 'new'
    end
  end

  def destroy
    @post = current_user.posts.find_by(id: params[:id])
    @post.destroy
    flash[:success] = "投稿を消しました。"
    redirect_to users_path
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end 
  
  def map
    @map_all = Post.all
  end

  private
  def post_params
    params.require(:post).permit(:title, :start_time, :contents,:place,:genre,:image,:lat,:lon) 
  end

end
