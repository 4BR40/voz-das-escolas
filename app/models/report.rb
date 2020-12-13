class Report < ApplicationRecord
  belongs_to :category
  belongs_to :user
  belongs_to :school
  has_many :reviews
  has_many_attached :photos
  validates :description, length: { maximum: 500,
                                    too_long: "%{count} caracteres, no máximo" }
end
