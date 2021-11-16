class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:username])
    if !@user
      @error = "Username is incorrect"
      render :login
    elsif !user.authenticate(params [:password])
      @error = "Password is Incorrect"
      render :login
    else
      session[:user_id] = @user.id
      redirect_to workouts_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end


  private

  def user_params
    params.require(:user).permit(:username, :password_digest)
  end
end
