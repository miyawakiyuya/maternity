class PostsController < ApplicationController

  before_action :set_q, only: [:index, :search]

  def index
    @post = Post.new
    @posts = Post.page(params[:page]).page(params[:page]).per(7).reverse_order
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to posts_path
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to posts_path

  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def search
    @results = @q.result
  end

  private

  def set_q
    @q = Post.ransack(params[:q])
  end


  def post_params
    params.require(:post).permit(:user_id,:title, :body)
  end
end
