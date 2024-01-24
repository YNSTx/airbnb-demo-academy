class Lecture < ApplicationRecord
  has_many :users
  has_many :reviews, dependent: :destroy
end
