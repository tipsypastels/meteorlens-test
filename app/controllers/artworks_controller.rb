class ArtworksController < ApplicationController
  before_action :set_artwork, only: %i|show edit update destroy|
  before_action :authenticate_user!, only: %i|new create edit update destroy|

  add_breadcrumb I18n.t('artworks.index.title'), :artworks_path

  def index
    @artworks = feed_for(Artwork)
      .with_attached_image
      .includes(:user)
  end

  def show
    add_breadcrumb @artwork.title
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
    @saved = @artwork.update(artwork_params)
    respond_to :js
  end

  private

  def set_artwork
    @artwork = Artwork.friendly.find(params[:id])
  end

  def artwork_params
    params.require(:artwork).permit(:title, :description, :image, :parallax, :tag_list)
  end
end
