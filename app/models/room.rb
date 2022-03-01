class Room < ApplicationRecord
  has_many :reservations
  belongs_to :user, optional: true

  validates :room_name, presence: true
  validates :room_introduction, presence: true, length: {in: 10..300}
  validates :price, numericality: true
  validates :address, presence: true

  mount_uploader :room_image, ImageUploader

end
