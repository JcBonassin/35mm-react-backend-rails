class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :update, :destroy]
  before_action :authorized

  # GET /photos
  def index
    # @photos = Photo.all
    @photos = Photo.where(user_id: @user.id)
    render json: @photos
  end

  # GET /photos/1
  def show
    # @photos = Photo.where(user_id: @user.id)
    render json: @photo
  end

  # POST /photos
  def create
    @photo = Photo.new(photo_params)
    @photo.user = @user

    if @photo.save
      render json: @photo, status: :created, location: @photo
    else
      render json: @photo.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /photos/1
  def update
    if @photo.update(photo_params)
      render json: @photo
    else
      render json: @photo.errors, status: :unprocessable_entity
    end
  end

  # DELETE /photos/1
  def destroy
    # @photo = Photo.where(user_id: @user.id)
    @photo.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def photo_params
      params.permit(:title, :body, :user_id, :featured_image)
    end
end
