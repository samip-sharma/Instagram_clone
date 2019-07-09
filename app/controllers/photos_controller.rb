class PhotosController < ApplicationController
# before_action :authorized, only:[:create]

  def new

  end

  def create
      @user=User.find(session[:id])
      @photo=Photo.create(user_id:@user.id,caption:params[:photo][:caption],image:params[:photo][:image])
      @user.photos << @photo
      redirect_to user_path @user
  end
end
