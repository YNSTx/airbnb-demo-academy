class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :lecture
  validates :available_places, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
