class Diary < ApplicationRecord
  belongs_to :user
  has_many :diary_images, dependent: :destroy
  attachment :image

  validates :start_time, presence: true
  validates :title, presence: true, length: { maximum: 50 }
  validates :body, presence: true, length: { maximum: 140 }
end
