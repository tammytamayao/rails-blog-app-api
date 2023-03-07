

class Api::V1::UsersController < ApplicationController
    def index
        @users = User.all
        render json: @users
    end

    def create
        if params[:password] != params[:password_confirmation]
            render :json => {:response => "password didn't match"}
        elsif User.exists?(email: params[:email])
            render :json => {:response => "email already taken"}
        else 
            @users = User.create(email: params[:email], password_digest: BCrypt::Password.create(params[:email]))
            if @users
                render :json => {:response => "registration successful"}
            else
                render json: @users.errors
                render :json => {:response => "registration failed"}
            end
            
        end
    end


end
