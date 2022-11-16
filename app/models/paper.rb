class Paper < ApplicationRecord
  validates :title, :venue, presence: true
  validates :year, numericality: true
end
