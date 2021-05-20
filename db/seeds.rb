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
    description: 'keeps you toasty warm in cold environments',
    icon: 'fas fa-fan' },
  { name: 'air conditioning',
    description: 'keeps it chill in hot environments',
    icon: 'fas fa-fan' },
  { name: 'shower',
    description: 'no need to run around to wash yourself!',
    icon: 'fas fa-shower' },
  { name: 'cleaning',
    description: 'easily microwave some popcorn',
    icon: 'fas fa-hand-sparkles'},
  { name: 'toaster',
    description: 'your best breakfast bread easily',
    icon: 'fas fa-bread-slice' },
  { name: 'tv',
    description: 'movie theatre on the go!',
    icon: 'fas fa-tv' },
  { name: 'shade',
    description: 'pull-out shade!',
    icon: 'fas fa-umbrella-beach' } ]

amenities.each do |amenity|
  Amenity.create!(
    name: amenity[:name],
    description: amenity[:description],
    icon: amenity[:icon]
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
  { name: 'Peaceful Getaway', description: 'cozy energy', address: 'Montreal, QC, Canada',
    },
  { name: "Rock n' Roll Roadie", description: 'country vibes', address: 'Laval, QC, Canada',
    },
  { name: 'Earthy Escape', description: 'eco-friendly choices', address: 'St. Jerome, QC, Canada',
    },
  { name: 'Surfer Retreat', description: 'radical wave hunter', address: 'Miami, Florida, USA',
    },
  { name: 'Family Blastoff!', description: 'many hidden compartments', address: 'Halifax, NS, Canada',
    },
  { name: 'Pet Planet', description: 'great for you and your pet pal', address: 'Toronto, ON, Canada',
    },
  { name: 'Awesome Tiny Home', description: 'everything you need!', address: 'Kingston, ON, Canada',
    },
  { name: 'Man Cave To-Go', description: 'peaceful bro escape', address: 'Ajax, ON, Canada',
    },
  { name: 'We <3 Travel', description: 'pack up and go real quick!', address: 'New Jersey, NY, USA',
    },
  { name: 'Toasty Road Home', description: 'great for winter escapes', address: 'North Bay, ON, Canada',
    } ]

th_details.each do |th|
  tiny_home = TinyHome.new(
    name: th[:name],
    address: th[:address],
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
    # begin
    #   ha.amenity = Amenity.all.sample
    #   ha.save!
    # rescue
    #   puts "combination already exists"
    # end
  end
end

puts "#{HomeAmenity.all.count} home amenities created!"
