class PhotosController < ApplicationController
# before_action :authorized, only:[:create]

  def new

  end

  def create
      @user=User.find(session[:id])
      if params[:photo][:image].nil?
        flash[:errors]="Please Upload a Image"
      redirect_to "/photos/new"
    else
      @photo=Photo.create(user_id:@user.id,caption:params[:photo][:caption],image:params[:photo][:image])
      @user.photos << @photo
      redirect_to user_path @user
    end
  end

  def show
    @photo=Photo.find(params[:id])
  end

  def edit
    @photo=Photo.find(params[:id])

  end

  def update
    @photo=Photo.find(params[:id])
    @photo.update(caption:params[:photo][:caption])
    redirect_to photo_path @photo
  end

  def destroy
    @user=User.find(session[:id])
    @photo=Photo.find(params[:id])
    @photo.destroy
    redirect_to user_path @user
  end

  def like
    # byebug
    @photo=Photo.find(params[:id])
    @photo.update(likes:@photo.likes+1)
    redirect_to users_path
  end
end
