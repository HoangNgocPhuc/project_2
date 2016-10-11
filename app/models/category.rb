class Category < ActiveRecord::Base
  has_many :posts
  validates :name, presence: true, length: { maximum: 140 }

  def self.search(search)
    if search
      where("name LIKE ?", "%#{search}%")
    else
      all
    end
  end
end
