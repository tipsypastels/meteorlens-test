class ArtworksController < ApplicationController
  before_action :set_artwork, only: %i|show edit update destroy|
  before_action :authenticate_user!, only: %i|new create edit update destroy|

  def index
    @artworks = Artwork.on_index
  end

  def show
  end

  def new
    @artwork = Artwork.new
  end

  def create
    @artwork = Artwork.new(artwork_params)
    @artwork.user = current_user

    if @artwork.save
      redirect_to @artwork
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @artwork.update(artwork_params)
      redirect_to @artwork
    else
      render 'new'
    end
  end

  private

  def set_artwork
    @artwork = Artwork.friendly.find(params[:id])
  end

  def artwork_params
    params.require(:artwork).permit(:title, :description, :image, :parallax)
  end
end
