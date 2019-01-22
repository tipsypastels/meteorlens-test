class User < ApplicationRecord
  extend FriendlyId

  has_many :artworks
  has_many :comments

  has_one_attached :avatar

  validates :username,
    presence: true,
    uniqueness: { case_sensitive: false },
    format: { with: /\A[a-zA-Z0-9_]+\Z/ },
    length: { in: 2..30 }
    
  acts_as_followable
  acts_as_follower
  
  devise :database_authenticatable, :registerable,
      :recoverable, :rememberable, :validatable
    
  friendly_id :username

  def avatar?
    avatar.attached?
  end

  def initial
    username[0].upcase
  end
end
