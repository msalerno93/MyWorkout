class SessionsController < ApplicationController

    def new
        render :new
    end

    def create
        @user = User.find_by(:username => params[:username])
        if @user && @user.authenticate(params[:password])
            login(@user)
            redirect_to "/workouts"
        else
            redirect_to "/login", :notice => "Can't Locate User"
        end
    end

    def destroy
        reset_session
        redirect_to "/login"
    end

    def omniauth
        user = User.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
            u.username = auth['info']['first_name']
            u.password = SecureRandom.hex(10)
        end
        if user.valid?
            login(user)
            redirect_to "/workouts"
        else
            redirect_to "/login"
        end
    end
    
    private

    def auth
        request.env['omniauth.auth']
    end
end

#     private

#     def user_params
#         params.require(:username).permit(:username, :password_digest)
#     end