class PostsController < ApplicationController
  def index
    @posts = Post.all
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(params[:post])
    if @post.save
      redirect_to @post, notice: 'A post has been created successfully'
    else
      render 'new'
    end
  end
  
  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    if @post.update_attributes(params[:post])
      redirect_to posts_path, notice: 'Post has been updated'
    else
      render action: 'edit'
    end
  end
  
  def destroy
    @post.destroy
    redirect_to posts_url
  end

end
