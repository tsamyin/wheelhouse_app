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


# # TINY HOMES
# puts 'creating tiny homes!'
# th_names =
# th_ids = []

# 10.times do
#   tiny_home = TinyHome.create!(
#     name: ,
#     address: Faker::Address,
#     description: ,
#     room_number: ,
#     size: ,
#     user_id: u_ids.sample
#   )
#   th_ids << tiny_home[:id]
# end


# # BOOKINGS
# 5.times do
#   Booking.create!(

#   )
# end

#       t.string :name
#       t.string :address
#       t.text :description
#       t.boolean :available
#       t.integer :price
#       t.integer :room_number
#       t.integer :size
#       t.references :user, null: false, foreign_key: true












