# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

AnimalShelter.destroy_all
AnimalShelter.reset_pk_sequence
User.destroy_all
User.reset_pk_sequence

6.times do |i|
    AnimalShelter.create!(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        name: Faker::TvShows::SouthPark.unique.character + ' Animal Shelter',
        email: Faker::Internet.email,
        address: Faker::Address.street_address,
        city: Faker::Address.city,
        state: Faker::Address.state,
        password_digest: 'abc123'
    )
end

puts "seeded 🐥🐥🐥"

