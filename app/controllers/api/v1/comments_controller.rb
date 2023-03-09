class Api::V1::CommentsController < ApplicationController
  
    def index
        @post ||= Post.find(params[:post_id])
        @comments = @post.comments
        render json: @comments
    end

    def show
      @post ||= Post.find(params[:post_id])
      @comment = @post.comments.find(params[:id])
      render json: @comment
    end
  
    def create
      @post ||= Post.find(params[:post_id])
      @comment = @post.comments.create!(comment_params)
      if @comment
        render json: @comment 
      else
        render json: @comment.errors
      end
    end
  
    def update
      @post ||= Post.find(params[:post_id])
      @comment = @post.comments.find(params[:id])
      if @comment.update(comment_params)
        render json: { post: @comment }
      else
        render json: @comment.errors
      end
    end
  
    def destroy
      @post ||= Post.find(params[:post_id])
      @comment = @post.comments.find(params[:id])
      @comment&.destroy
      render json: { message: 'Comment deleted!' }
    end
  
    private
  
    def comment_params
        params.require(:comment).permit(:body)
    end

end
