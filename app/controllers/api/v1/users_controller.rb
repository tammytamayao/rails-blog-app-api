

class Api::V1::UsersController < ApplicationController
    #def index
    #    @users = User.all
    #    render json: @users
    #end

    def register
        if params[:password].length() < 8
            render :json => {:response => "password must atleast be 8 characters"}
        elsif params[:password] != params[:password_confirmation]
            render :json => {:response => "password didn't match"}
        elsif User.exists?(email: params[:email])
            render :json => {:response => "email already taken"}
        else 
            @users = User.create(email: params[:email], password_digest: BCrypt::Password.create(params[:password]))
            if @users
                
                render :json => {:response => "registration successful"}
                ActionMailer::Base.mail(from: "Rails Blog App", to: params[:email], subject: "Account Verification", body: "Verify your account by clicking on this link " + ENV["URL_REACT"] + "verify?token=").deliver

            else
                render json: @users.errors
                render :json => {:response => "registration failed"}
            end
            
        end
    end

    
    def login

        ca = User.find_by_email(params[:email])
        #cb = User.find_by_password_digest('')
        #logger.info("Logs" + ca.password_digest)
        #if User.where(:id => (ca.id & cb.id))

        

        if BCrypt::Password.new(ca.password_digest) === BCrypt::Engine.hash_secret(params[:password], ca.password_digest)  
            #render :json => {:response => "authenticated" }
            if ca.confirmed_at === nil
                render :json => {:response => "email confirmation required" }
            else
                render :json => {:response => "authenticated" }
            end
        else 
            render :json => {:response => "log in failed"}
        end
        
    end


end
