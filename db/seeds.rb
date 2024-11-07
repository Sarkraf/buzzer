# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Destroying all parties..."
puts "Destroying all buzzs..."
Party.destroy_all # Destroy all parties and groups + buzzs (dependent: :destroy)
Avatar.destroy_all # Destroy all avatars

puts "Creating parties..."
Party.create!(name: "Le Wagon", passphrase: "lewagon", url: "lewagon")

puts "Creating avatars..."
Avatar.create!(filename: "bill.png", party: Party.last)
Avatar.create!(filename: "cockroach.png", party: Party.last)
Avatar.create!(filename: "cursed.png", party: Party.last)
Avatar.create!(filename: "dwight.png", party: Party.last)
Avatar.create!(filename: "jeff.png", party: Party.last)
Avatar.create!(filename: "jul.png", party: Party.last)
Avatar.create!(filename: "mickael.png", party: Party.last)
Avatar.create!(filename: "morty.png", party: Party.last)
Avatar.create!(filename: "penguin.png", party: Party.last)
Avatar.create!(filename: "rick.png", party: Party.last)
Avatar.create!(filename: "robocop.png", party: Party.last)
