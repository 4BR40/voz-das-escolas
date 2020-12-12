class School < ApplicationRecord
  has_one_attached :photo
  has_many :users
  has_many :reports
end
