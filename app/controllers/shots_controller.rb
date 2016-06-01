class ShotsController < ApplicationController
  # before_action :set_shot, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
    @shots = Shot.all
    @comments = Comment.all
    if params[:search]
      @shots = Shot.search(params[:search]).order("created_at DESC")
    else
      @shots = Shot.all.order('created_at DESC')
    end
  end

  def show
    @shot = Shot.find(params[:id])
    @users = User.all
    @shots = Shot.all
    # @comments = Comment.where(params[:id])
    @comments = @shot.comments
  end

  def new
    @shot = Shot.new
  end

  def edit
    @shot = Shot.find(params[:id])
    @comment = Comment.find(params[:id])
  end

  def create
    @shot = Shot.new(shot_params)
    # @user = User.create( user_params ) paperclip recommended format

    respond_to do |format|
      if @shot.save
        format.html { redirect_to @shot, notice: 'Shot was successfully created.' }
        format.json { render :show, status: :created, location: @shot }
      else
        format.html { render :new }
        format.json { render json: @shot.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @shot.update(shot_params)
        format.html { redirect_to @shot, notice: 'Shot was successfully updated.' }
        format.json { render :show, status: :ok, location: @shot }
      else
        format.html { render :edit }
        format.json { render json: @shot.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @shot.destroy
    respond_to do |format|
      format.html { redirect_to shots_url, notice: 'Shot was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_shot
    @shot = Shot.find(params[:id])
  end

  def shot_params
    # params.require(:user).permit(:avatar) paperclip recommended format
    params.require(:shot).permit(:id, :title, :description, :width, :height, :tags, :image_url, :image_path, :localshotimage)
  end

end
