class ShotsController < ApplicationController
  # before_action :set_shot, only: [:show, :edit, :update, :destroy]

  # GET /shots
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

  # GET /shots/1
  def show
    @shot = Shot.find(params[:id])
    @users = User.all
    @shots = Shot.all
    # @comments = Comment.where(params[:id])
    @comments = @shot.comments
  end

  # GET /shots/new
  def new
    @shot = Shot.new
  end

  # GET /shots/1/edit
  def edit
    @shot = Shot.find(params[:id])
    @comment = Comment.find(params[:id])
  end

  # POST /shots
  def create
    @shot = Shot.new(shot_params)

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

  # PATCH/PUT /shots/1
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

  # DELETE /shots/1
  def destroy
    @shot.destroy
    respond_to do |format|
      format.html { redirect_to shots_url, notice: 'Shot was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shot
      @shot = Shot.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shot_params
      params.require(:shot).permit(:id, :title, :description, :width, :height, :tags, :image_url, :image_path)
    end
end
