class CommentsController < ApplicationController

  def index
    @comment = Comment.find(params[:id])
    @comments = Comment.all
    @shots = Shot.all
    @users = User.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comemnt = Comment.new
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def create
    #@comment = Comment.new(params[:post]) original
    @comment = user_id.comments.build(params[:post])
    # @comment = Comment.create( comment_params ) version model for paperclip

      respond_to do |format|
      if @comment.save
         format.html { redirect_to @comment, notice: 'Comment posted.  Nice!' }
         format.json { render json: @comment, status: :created, location: @comment }
      else
         format.html { render action: "new" }
      end
    end
  end

  def update
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:post])
       format.html { redirect_to @comment, notice: 'Comment was updated.  Much better!' }
       format.json { head :no_content }
      else
       format.html { render action: "edit" }
      end
    end
  end

  def user_params
  # params.require(:user).permit(:avatar) paperclip recommended format
    params.require(:comment).permit(:localcommentimage)
  end

end
