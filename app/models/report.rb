class Report < ApplicationRecord
  belongs_to :category
  belongs_to :user
  belongs_to :school
  has_many :reviews, dependent: :destroy
  has_many_attached :photos
  validates :description, presence: true, length: { maximum: 500,
                                                    too_long: "%{count} caracteres, no máximo" }
  acts_as_votable
end
