class User < ApplicationRecord
  has_many :artworks
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username,
    presence: true,
    uniqueness: { case_sensitive: false },
    format: { with: /\A[a-zA-Z0-9_]+\Z/ },
    length: { in: 2..30 }

  extend FriendlyId
  friendly_id :username
end
