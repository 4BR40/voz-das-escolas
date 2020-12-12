class Category < ApplicationRecord
  has_many :categories
  has_many :reports
  has_one_attached :photo
end
