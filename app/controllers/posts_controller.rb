class PostsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show, :search]

  def new
  	@post = Post.new
  end

  def create
  	@post = Post.new(post_params)
  	@post.user_id = current_user.id
  	@post.save
  	redirect_to @post
  end

  def index
  	@posts = Post.all
  	@categories = Category.all
  end

  def show
  	@post = Post.find(params[:id])
  	@post_comment = PostComment.new
  	@categories = Category.all
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
  	post = Post.find(params[:id])
    post.update(post_params)
    redirect_to post_path(post)
  end

  def search
    @posts = Post.all.search(params[:search])
    @categories = Category.all
  end

  def destroy
  	
  end

  private
  def post_params
  	params.require(:post).permit(:title, :content, category_ids: [])
  end



end
