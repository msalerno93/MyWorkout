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
            @errors = @user.errors.full_messages
            render :new
        end

    end

    private
        def user_params
            params.require(:user).permit(:username, :password_digest)
        end
end
