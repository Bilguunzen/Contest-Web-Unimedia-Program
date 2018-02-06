class Cui < ApplicationRecord
  belongs_to :user
  belongs_to :contest
  has_many :submissions
end
