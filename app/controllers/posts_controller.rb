class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if Post.new(post_params).valid?
      @post.update(post_params)
      redirect_to post_path(@post)
    else
      @new_post = Post.new(post_params)
      render :edit
    end
  end

  private

  def post_params
    params.permit(:title, :category, :content)
  end
end
