class FollowsController < ApplicationController

  def new
    @user_following=User.find(session[:id])
    @user_followed=User.find(params[:id])
    @user_following.followers << @user_followed
    redirect_to users_path
  end
end
