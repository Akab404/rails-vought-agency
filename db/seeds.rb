# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "json"
require "open-uri"

# user_seed = User.new(email: "anthins.errt@gmail.com", password: "azerty")
# user_seed.save!

url = "https://akabab.github.io/superhero-api/api/all.json"
heroes = URI.open(url).read
hero = JSON.parse(heroes)

hero.each do |h|
  Superhero.create!(name: h["name"], team: h["biography"]["publisher"], image_url: h["images"]["md"], user_id: "1")
end
