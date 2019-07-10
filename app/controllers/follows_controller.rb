class FollowsController < ApplicationController

  def new
    @user_following=User.find(session[:id])
    @user_followed=User.find(params[:id])
    @user_following.followers << @user_followed
    redirect_to users_path
  end

  def following
    @user=User.find(session[:id])
    @following=@user.followers
    render "following"
  end

  def followers
    @user=User.find(session[:id])
    @followers=@user.followees
    render "followers"
  end

  def show
    @user=User.find(params[:id])
    render "show"
  end

  def destroy
    @user=User.find(session[:id])
      @follow=Follow.find_by(follower_id:params[:id], followee_id:session[:id])
      @follow.destroy
      redirect_to  "/follow/following"
  end

  def showimage
    @photo=Photo.find(params[:id])
    render "showimage"
  end
end
