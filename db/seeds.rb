# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'cleaning db!'
# HomeAmenity.destroy_all
Amenity.destroy_all
# Booking.destroy_all
# TinyHome.destroy_all
User.destroy_all

# AMENITIES
puts 'creating amenities!'

amenities = [
  { name: 'heating',
    description: 'keeps you toasty warm in cold environments' },
  { name: 'air conditioning',
    description: 'keeps it chill in hot environments' },
  { name: 'oven',
    description: 'cook up some food in your tiny home!' },
  { name: 'microwave',
    description: 'easily microwave some popcorn' },
  { name: 'toaster',
    description: 'your best breakfast bread easily' },
  { name: 'tv',
    description: 'movie theatre on the go!' },
  { name: 'shade',
    description: 'pull-out shade!' } ]

amenities.each do |amenity|
  Amenity.create!(
    name: amenity[:name],
    description: amenity[:description],
  )
end

puts "#{amenities.count} amenities created!"


# USERS
puts 'creating users!'

emails = ['pascal@th.com', 'holly@th.com', 'thomas@th.com', 'joe@average.com', 'jess@google.com']
u_ids = []

emails.each do |email|
  user = User.create!(
    email: email,
    password: '123456'
  )
  u_ids << user[:id]
end
puts "#{u_ids.count} users created!"

th_details = [
  { name: 'Peaceful Getaway', description: 'cozy energy'},
  { name: "Rock n' Roll Roadie", description: 'country vibes'},
  { name: 'Earthy Escape', description: 'eco-friendly choices'},
  { name: 'Couples Retreat', description: 'perfect for a loving double'},
  { name: 'Family Blastoff!', description: 'many hidden compartments'},
  { name: 'Pet Planet', description: 'great for you and your pet pal'},
  { name: 'Awesome Tiny Home', description: 'everything you need!'},
  { name: 'Man Cave To-Go', description: 'peaceful bro escape'},
  { name: 'We <3 Travel', description: 'pack up and go real quick!'},
  { name: 'Toasty Road Home', description: 'great for winter escapes'} ]
# TINY HOMES
puts 'creating tiny homes!'
th_names =
th_ids = []

th_details.each do
  tiny_home = TinyHome.create!(
    name: th_details[:name],
    address: Faker::Address,
    description: th_details[:description] ,
    room_number: rand(1..2),
    price: rand(50..100),
    size: [80, 90, 100, 110, 120].sample,
    user_id: u_ids.sample
  )
  th_ids << tiny_home[:id]
end

puts "#{th_ids.count} tiny homes created!"

# BOOKINGS
5.times do
  Booking.create!(
    start_date:
    end_date:
    total_cost:
    user_id:
    tiny_home_id:
  )
end

#       t.string :name
#       t.string :address
#       t.text :description
#       t.boolean :available
#       t.integer :price
#       t.integer :room_number
#       t.integer :size
#       t.references :user, null: false, foreign_key: true












