class SessionsController < ApplicationController

    def new
        render :new
    end

    def create
        @user = User.find_by(:username => params[:username])
        if @user
            login(@user)
            redirect_to "/workouts"
        else
            redirect_to "/login", :notice => "Can't Locate Username"
        end
    end

    def destroy
        reset_session
        redirect_to "/login"
    end
    
end

#     private

#     def user_params
#         params.require(:username).permit(:username, :password_digest)
#     end