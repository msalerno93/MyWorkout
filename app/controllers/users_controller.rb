class UsersController < ApplicationController

    def new
        # @user = User.new
        if session[:current_user_id]
            redirect_to "/"
        end
    end


    def create
        @user = User.new
        @user.username = params[:username]
        @user.password_digest = params[:password_digest]
        @user.save
        redirect_to "/workouts"
        # @user = User.new(user_params)
        # if @user.save
        #     session[:user_id] = @user.id
        #     redirect_to "/workouts"
        # else
        #     flash[:register_errors] = user.errors.full_messages
        #     redirect_to "/"
        # end

    end

    private
        def user_params
            params.require(:user).permit(:username, :password_digest)
        end
end
