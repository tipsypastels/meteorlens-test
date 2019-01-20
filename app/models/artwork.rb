class Artwork < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  
  # after_create :assign_primary_color

  belongs_to :user
  counter_culture :user

  has_one_attached :image

  # TODO see helpers file
  # def assign_primary_color
  #   return if color
  # end
  # handle_asynchronously :assign_primary_color

  scope :on_index, -> { # TODO ordering etc
    all.with_attached_image.includes(:user)
  }
end
