class Lecture < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :reservations, dependent: :destroy
  validates :available_places, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

end
