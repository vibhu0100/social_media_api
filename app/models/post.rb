class Post < ApplicationRecord
  has_many_attached :images
  has_many :comments, -> { order 'created_at DESC'}
  has_many :likes
end
