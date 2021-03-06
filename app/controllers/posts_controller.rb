class PostsController < ApplicationController

  before_action :set_q, only: [:index, :search]
  before_action :find_post, only: [:show, :edit, :update, :destroy]

  def index
    @post = Post.new
    @posts = Post.page(params[:page]).page(params[:page]).per(7).reverse_order
  end

  def show
    @post_comment = PostComment.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path
    else
      @posts = Post.page(params[:page]).page(params[:page]).per(7).reverse_order
      @q = Post.ransack(params[:q])
      render :index
    end
  end

  def update
    @post.update(post_params)
    redirect_to posts_path

  end

  def destroy
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
  
  def find_post
    @post = Post.find(params[:id])
  end


  def post_params
    params.require(:post).permit(:user_id,:title, :body)
  end
end
