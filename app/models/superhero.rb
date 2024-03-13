class Superhero < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy

  validates :name, presence: true, allow_blank: false
end
