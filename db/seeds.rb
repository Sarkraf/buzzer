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
puts "Destroying all groups..."
puts "Destroying all buzzs..."
Party.destroy_all # Destroy all parties and groups + buzzs (dependent: :destroy)

puts "Creating parties..."
Party.create!(name: "Le Wagon", passphrase: "lewagon", url: "lewagon")

puts "Creating groups..."
Group.create!(name: "Group 1", party: Party.first)
Group.create!(name: "Group 2", party: Party.first)

puts "Creating avatars..."
Avatar.create!(filename: "bill.png")
Avatar.create!(filename: "cockroach.png")
Avatar.create!(filename: "cursed.png")
Avatar.create!(filename: "dwight.png")
Avatar.create!(filename: "jeff.png")
Avatar.create!(filename: "jul.png")
Avatar.create!(filename: "mickael.png")
Avatar.create!(filename: "morty.png")
Avatar.create!(filename: "penguin.png")
Avatar.create!(filename: "rick.png")
Avatar.create!(filename: "robocop.png")
