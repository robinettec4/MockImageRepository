class PicturesController < ApplicationController
  before_action :set_picture, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [ :index, :show ]
  #before_action :correct_user, only: [ :edit, :update, :destroy ]
  helper_method :user_name
  # GET /pictures or /pictures.json
  def index
    @pictures = Picture.all
  end

  # GET /pictures/1 or /pictures/1.json
  def show
  end

  # GET /pictures/new
  def new
    #@picture = Picture.new
    @picture = current_user.pictures.build
  end

  # GET /pictures/1/edit
  def edit
  end

  # POST /pictures or /pictures.json
  def create
    #@picture = Picture.new(picture_params)
    @picture = current_user.pictures.build(picture_params)
    respond_to do |format|
      if @picture.save
        format.html { redirect_to @picture, notice: "Picture was successfully created." }
        format.json { render :show, status: :created, location: @picture }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pictures/1 or /pictures/1.json
  def update
    respond_to do |format|
      if @picture.update(picture_params)
        format.html { redirect_to @picture, notice: "Picture was successfully updated." }
        format.json { render :show, status: :ok, location: @picture }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pictures/1 or /pictures/1.json
  def destroy
    @picture.destroy
    respond_to do |format|
      format.html { redirect_to pictures_url, notice: "Picture was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def user_name(user_id)
    sql = "SELECT name FROM users WHERE id = #{user_id}"
    result = ActiveRecord::Base.connection.execute(sql)
    if result.nil?
      return result[0]['name']
    else
      return "Deleted"
    end
  end


  #user authentication
  def correct_user
    @picture = current_user.pictures.find_by( id: params[ :id ] )
    redirect_to pictures_path, notice: "not authorized to edit this picture" if @picture.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_picture
      @picture = Picture.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def picture_params
      params.require(:picture).permit(:file_name, :user_id, :image, :user_name)
    end
end
