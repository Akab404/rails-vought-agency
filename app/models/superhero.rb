class Superhero < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :name, presence: true
  validates :team, presence: true
end
