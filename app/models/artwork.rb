class Artwork < ApplicationRecord
  default_scope {
    order created_at: :desc
  }
  
  extend FriendlyId
  include Commentable
  
  belongs_to :user
  counter_culture :user
  
  has_one_attached :image

  friendly_id :title, use: :slugged
end
