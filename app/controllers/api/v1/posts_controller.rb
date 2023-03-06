class Api::V1::PostsController < ApplicationController


  def index
    @posts = Post.all
    render json: @posts
  end

  def show
    @post = Post.find(params[:id])
    render json: @post
  end

  def create
    @post = Event.create!(post_params)
    if @post
      render json: @post 
    else
      render json: @post.errors
    end
  end

  def update
    @post = Event.find(params[:id])
    if @post.update(post_params)
      render json: { message: 'Post updated!' }
    else
      render json: @post.errors
    end
  end

  def destroy
    @post = Event.find(params[:id])
    @post&.destroy
    render json: { message: 'Post deleted!' }
  end

  private

  def post_params
    params.require(:event).permit(:title, :body)
  end

  def set_post
    @post ||= Post.find(params[:id])
  end

end
