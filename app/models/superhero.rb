class Superhero < ApplicationRecord
  CATEGORY = ["Mangeur de bananes", "Tireur d'exception", "Homme en slip", "Créature chelou", "Développeur full stack"]

  include PgSearch::Model
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy

  validates :name, presence: true, allow_blank: false

  pg_search_scope :search_by_name_and_team,
  against: [ :name, :team ],
  using: {
    tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }
end
