class SessionsController < ApplicationController

    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to workouts_path
        else
            @error = @user.errors.full_messages
            render :signup
        end
    end

    def logout
        session.clear
        redirect_to root_path
    end


