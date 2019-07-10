class UsersController < ApplicationController

  def index
    @user=User.find(session[:id])
    followers=@user.followers
    @user_suggestion1=User.all.select{|user| user !=@user}
    @user_suggestion=@user_suggestion1.select{|user| followers.exclude?(user)}
  end

  def search

    if params[:search]
      @users = User.where('name LIKE ?', "%#{params[:search]}%")
    else
    @users=User.all
    end
    # byebug
    render "search"
  end



  def show
    # byebug
    @user=User.find(session[:id])
  end

  def new

  end

  def create
    @user=User.create(user_params)
    session[:id]=@user.id
    if @user.valid?
    redirect_to @user
  else
    redirect_to  new_user_path
  end
  end

  def login

  end

  def edit
@user=User.find(session[:id])
  end

  def update
    @user=User.find(session[:id])
    @user.update(user_params)
    redirect_to user_path @user
  end

  def verify_login
    if User.find_by(name: params[:name])
      @user=User.find_by(name: params[:name])
      session[:id]=@user.id
      redirect_to user_path @user
    else
      redirect_to "/login"
    end
  end



  private
  def avatar_params
    params.permit(:avatar)
  end

  def user_params
    params.require(:user).permit(:name,:user_name,:age,:bio,:password)
  end
end
