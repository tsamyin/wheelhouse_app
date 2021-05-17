# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'cleaning db!'
Amenity.destroy_all

puts 'creating amenities!'

Amenity.create!(
  name: 'air conditioning',
  description: 'keeps it chill in hot environments',
)

Amenity.create!(
  name: 'heating',
  description: 'keeps you toasty warm in cold environments',
)

Amenity.create!(
  name: 'oven',
  description: 'cook up some food in your tiny home!',
)

Amenity.create!(
  name: 'microwave',
  description: 'easily microwave some popcorn' ,
)

Amenity.create!(
  name: 'toaster',
  description: 'your best breakfast bread easily',
)

Amenity.create!(
  name: 'tv',
  description: 'movie theatre on the go!',
)

Amenity.create!(
  name: 'shade',
  description: 'pull-out shade!',
)

puts 'all done!'
