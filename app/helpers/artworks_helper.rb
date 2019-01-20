module ArtworksHelper
  # TODO don't know how to pass the image url in development  
  # def primary_color_of(artwork)
  #   return DEFAULT_COLOR unless Rails.env.production?
  #   algorithmia('vagrant/ColorSchemeExtraction/0.2.0', url: url)
  # rescue
  #   DEFAULT_COLOR
  # end

  # DEFAULT_COLOR = '#dddddd'

  def next_artwork_by_author_of(artwork)
    Artwork.where('created_at > :created_at AND user_id = :user_id', 
      created_at: artwork.created_at, 
      user_id: artwork.user_id,
    ).first
  end

  def prev_artwork_by_author_of(artwork)
    Artwork.where('created_at < :created_at AND user_id = :user_id',
      created_at: artwork.created_at,
      user_id: artwork.user_id,
    ).last
  end

  def parallax_image_tag(image, opts = {})
    rp 'components/parallax', image: image, opts: opts    
  end

  def artwork_tag(artwork, opts = {})
    image_tag artwork.image, opts

    # TODO parallax eventually
    # if artwork.parallax?
    #   parallax_image_tag(artwork.image, opts)
    # else
    #   image_tag(artwork.image, opts)
    # end
  end
end