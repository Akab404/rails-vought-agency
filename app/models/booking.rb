class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :superhero
end
