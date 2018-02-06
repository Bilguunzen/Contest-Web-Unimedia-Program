class Contest < ApplicationRecord
  has_many :cuis
  has_many :users, through: :cuis
  has_attached_file :image, { validate_media_type: false }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates :title,  presence: true
  validates :start,  presence: true
  validates :deadline,  presence: true
  validates :detail,  presence: true
  validates :prize,  presence: true
  validates :point,  presence: true
  validates :time,  presence: true
end
