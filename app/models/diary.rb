class Diary < ApplicationRecord
  belongs_to :user
  has_many :diary_images, dependent: :destroy
  attachment :image

  validates :start_time, presence: true
  validates :title, presence: true
  validates :body, presence: true
end
