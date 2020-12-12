class Category < ApplicationRecord
  has_many :categories
  has_one_attached :photo
end
