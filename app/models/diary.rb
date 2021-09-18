class Diary < ApplicationRecord
  belongs_to :user
  has_many :diary_images, dependent: :destroy
  attachment :image
end
