module Commentable
  extend ActiveSupport::Concern

  included do
    has_many :comments, as: :commentable
  end

  def comments_from(user)
    comments.where(user: user)
  end

  def comments_from?(user)
    comments_from(user).any?
  end
end