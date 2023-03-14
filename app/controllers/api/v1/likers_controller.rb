class Api::V1::LikersController < ApplicationController

    before_action :set_post

    def show
      @like_count = @post.likers.count
      @post.update(likes: @like_count)
      render json: @post
    end

    def create
      @like = @post.likers.create!(post_id: params[:post_id])
      if @like
        render json: @post
      else 
        render json: @post.errors
      end
    end

    private

    def set_post
      @post ||= Post.find(params[:post_id])
    end
end
