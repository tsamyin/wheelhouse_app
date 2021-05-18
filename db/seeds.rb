# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'cleaning db!'
HomeAmenity.destroy_all
Amenity.destroy_all
Booking.destroy_all
TinyHome.destroy_all
User.destroy_all

# AMENITIES
puts 'creating amenities...'

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
puts 'creating users...'

emails = ['pascal@th.com', 'holly@th.com', 'thomas@th.com', 'joe@average.com', 'jess@google.com']

emails.each do |email|
  user = User.create!(
    email: email,
    password: '123456'
  )
end
puts "#{User.all.count} users created!"

# TINY HOMES
puts 'creating tiny homes...'

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

th_details.each do |th|
  tiny_home = TinyHome.new(
    name: th[:name],
    address: Faker::Address,
    description: th[:description] ,
    room_number: rand(1..2),
    price: rand(50..100),
    size: [80, 90, 100, 110, 120].sample
  )
  tiny_home.user = User.all.sample
  tiny_home.save!
end

puts "#{TinyHome.all.count} tiny homes created!"

# BOOKINGS
puts 'creating bookings...'

5.times do
  booking = Booking.new(
    start_date: rand(30..60).days.from_now,
    end_date: rand(61..90).days.from_now
  )
  booking.user = User.all.sample
  booking.tiny_home = TinyHome.all.sample
  booking.save!
end

puts "#{Booking.all.count} bookings created!"

# HOME AMENITIES
puts 'creating home amenities...'

TinyHome.all.each do |th|
  amenities_array = Amenity.all.to_a.clone
  rand(3...Amenity.all.size).times do
    ha = HomeAmenity.new
    ha.tiny_home = th
    amenity = amenities_array.sample
    ha.amenity = amenity
    amenities_array.delete(amenity)
    ha.save!
    puts "created home amenity #{ha.id}"
    # begin
    #   ha.amenity = Amenity.all.sample
    #   ha.save!
    # rescue
    #   puts "combination already exists"
    # end
  end
end

puts "#{HomeAmenity.all.count} home amenities created!"

#       t.string :name
#       t.string :address
#       t.text :description
#       t.boolean :available
#       t.integer :price
#       t.integer :room_number
#       t.integer :size
#       t.references :user, null: false, foreign_key: true












