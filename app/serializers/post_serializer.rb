class PostSerializer < ActiveModel::Serializer
  include ActionView::Helpers::DateHelper
  include ActiveStorage::Blobs
  include Rails.application.routes.url_helpers
  has_many :comments
  attributes :id, :owner, :picture, :caption, :created, :liked_by
  def owner
    User.find(object.user_id).name
  end
  def picture
    p = []
    object.images.each do |img|
      p.append(rails_blob_path(img, only_path: true))
    end
    return p
  end
  def created
    distance_of_time_in_words(object.created_at, Time.now) + " ago"
  end
  def liked_by
    users = []
    object.likes.each do |l|
      users.append(User.find(l.user_id).name)
    end
    return users
  end
  def default_serializer_options
    {root: true}
  end
end
