class Report < ApplicationRecord
  belongs_to :category
  belongs_to :user
  belongs_to :school
  has_many_attached :photos
end
