class Review < ApplicationRecord
  belongs_to :user
  belongs_to :report
  has_many_attached :photos
  validates :comment, presence: true
end
