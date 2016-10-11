class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :likes, through: :votes, source: :user
  belongs_to :user
  
  mount_uploader :attachment, AttachmentUploader
  validates :title, presence: true, length: { maximum: 140 }
  validates :user_id, presence: true

  def self.search(search)
    if search
      where("title LIKE ?", "%#{search}%")
    else
      all
    end
  end

  def list_comments
    self.comments
  end

  def name_file
    File.basename(self.attachment.get_name)
  end

  def ext_file
    File.extname(self.attachment.get_name)
  end
end
