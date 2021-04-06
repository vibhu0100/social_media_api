class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :friends
  reg_alpha = /\A[a-zA-Z]+\z/
  validates :name, presence: true, format: {with: reg_alpha}
  reg_email = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: {with:reg_email}
  validates :contact, numericality: { only_integer: true}, length: {is: 10}
  validates :password, length: {minimum: 6}
  validates :status, length: {maximum: 100}
  
  
  def friend
    status = 'Accepted'
    Friend.where("user_id=? AND request=?",  self.id, status)
  end

  def request
    status = 'Requested'
    Friend.where("friend_id=? AND request=?",  self.id, status)
  end

  def feed
    a = 'Accepted'
    friend_ids = "(SELECT friend_id FROM friends WHERE user_id=#{self.id} AND request='Accepted')"
    Post.where("user_id In #{friend_ids} OR user_id IN (SELECT id FROM users WHERE public_acc=true) OR user_id=?", self.id)
  end
end
  