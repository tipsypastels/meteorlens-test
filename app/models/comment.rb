class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  counter_culture :commentable, column_name: :comments_count

  belongs_to :user
  counter_culture :user
end
