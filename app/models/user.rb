class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
<<<<<<< HEAD
  has_many :sessions, through: :reservations
  validates :first_name, presence: true
  validates :last_name, presence: true
=======

  validates :first_name, pressence: :true
  validates :last_name, pressence: :true

>>>>>>> 96b06c5ae604eefbf66f51f32ac6fbda33a90138
end
