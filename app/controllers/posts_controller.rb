class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      @post.save_tags(params[:post][:tag])
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      @post.save_tags(params[:post][:tag])
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    Post.find(params[:id]).destroy()
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
