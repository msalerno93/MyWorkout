class UsersController < ApplicationController

    def new
        @user = User.new
    end


    def create
        @user = User.new(user_params)
        if @user.save
            login(@user)
            redirect_to "/workouts"
        else
            redirect_to "/register", :notice => "Username Already Taken"
        end

    end

    private
        def user_params
            params.require(:user).permit(:username, :password_digest)
        end
end
