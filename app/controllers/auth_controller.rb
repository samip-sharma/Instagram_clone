class AuthController < ApplicationController

  def new

  end

  def create
    @user=User.find_by(user_name:params[:user_name])
    if @user && @user.authenticate(params[:password])
      session[:id]=@user.id
      redirect_to users_path
    else
      redirect_to '/login'
    end
  end

  def destroy
    session.delete :id
    redirect_to "/login"
  end
end
