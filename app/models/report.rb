class Report < ApplicationRecord
  belongs_to :category
  belongs_to :user
  belongs_to :school
  has_many :reviews, dependent: :destroy
  has_one_attached :photo
  validates :description, length: { maximum: 500,
                                    too_long: "%{count} caracteres, no máximo" }
end
