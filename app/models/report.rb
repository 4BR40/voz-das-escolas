class Report < ApplicationRecord
  belongs_to :category
  belongs_to :user
  belongs_to :school
  has_many :reviews, dependent: :destroy
  has_many_attached :photos
  validates :description, length: { maximum: 500,
                                    too_long: "%{count} caracteres, no máximo" }
  acts_as_votable

  include PgSearch::Model
  pg_search_scope :search_general,
                  against: %i[description],
                  associated_against: {
                    user: [:name],
                    category: [:name],
                    school: [:name]
                  },
                  using: {
                    tsearch: { prefix: true }
                  }
end
