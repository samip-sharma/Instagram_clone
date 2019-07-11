class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    Comment.create(user_id:session[:id], text:params[:text], photo_id:params[:id])
    where=params[:where]
    if where== "index"
    redirect_to users_path
    elsif where =="self"
    redirect_to "/photos/#{params[:id]}"
  else
    redirect_to display_pic_path(params[:id])
  end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json


  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    # byebug
    @comment=Comment.find(params[:id])
    @comment.destroy
    pic_id=params[:picid]
    redirect_position=params[:where]
    if redirect_position=="self"
      redirect_to "/photos/#{pic_id}"
    else
    redirect_to display_pic_path(pic_id)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:comment, :user_id, :photo_id)
    end
end
