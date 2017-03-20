class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  has_many :notifications, as: :notificable, dependent: :destroy
end
