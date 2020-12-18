class School < ApplicationRecord
  has_one_attached :photo
  has_many :users
  has_many :reports

  include PgSearch::Model
  pg_search_scope :search_general,
                  against: %i[name address city state location],
                  associated_against: {
                    reports: [:description]
                  },
                  using: {
                    tsearch: { prefix: true }
                  }
end
