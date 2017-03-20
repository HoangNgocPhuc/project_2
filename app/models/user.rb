class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true, length: {maximum: 30}
  has_many :comments, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :post_likes, through: :votes, source: :post
  has_many :notifications, dependent: :destroy
  def admin?
    self.role == 1
  end

  def like_post(post, user)
    v = self.votes.create(post_id: post.id)
    v.notifications.create({post_id: post.id, user_id: user.id})
  end

  def unlike_post(post)
    v = self.votes.find_by(post_id: post.id).destroy
    v.notifications.delete_all
  end

  def liked?(post)
    self.post_likes.include?(post)
  end

  def self.search(search)
    if search
      where("name LIKE ?", "%#{search}%")
    else
      all
    end
  end

end
