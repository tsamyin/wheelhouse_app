require "open-uri"

puts 'cleaning db!'
Review.destroy_all
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

emails = ['pascal@th.com', 'holly@th.com', 'thomas@th.com', 'daniel@google.com', 'anne-ma@google.com']
avatars = ['https://avatars.githubusercontent.com/u/77168127?v=4',
           'https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1617638724/rozdl8g3ybb6siqechzz.jpg',
           'https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1617625823/uxiisxmqoxwg6ltetmwt.jpg',
           'https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1617128231/a2jv0r1qgeekuaptcyfw.jpg',
           'https://avatars.githubusercontent.com/u/77209045?v=4']
count = 0
emails.each do |email|
  user = User.new(
    email: email,
    password: '123456'
  )
  file = URI.open(avatars[count])
  user.avatar.attach(io: file, filename: "avatar.jpg", content_type: 'image/png')
  user.save!
  count += 1
end
puts "#{User.all.count} users created!"

# TINY HOMES
puts 'creating tiny homes...'

th_details = [
  { name: 'Peaceful Getaway', description: 'cozy energy', address: 'Montreal, QC, Canada',
    images: ['https://cdn.shopify.com/s/files/1/1561/8759/files/Orono_Debut_Tiny_House_on_Wheels_by_Evergreen_Tiny_Homes_1024x1024.jpg?v=1547149787']},
  { name: "Rock n' Roll Roadie", description: 'country vibes', address: 'Laval, QC, Canada',
    images: ["https://lookout.brightspotcdn.com/dims4/default/e96fc0d/2147483647/strip/true/crop/3600x2401+0+0/resize/840x560!/quality/90/?url=http%3A%2F%2Flookout-local-brightspot.s3.amazonaws.com%2F4d%2F14%2F102996ea41b2b225bd97bf4f6a20%2F97a1194.jpg"]},
  { name: 'Earthy Escape', description: 'eco-friendly choices', address: 'St. Jerome, QC, Canada',
    images: ['https://opimedia.azureedge.net/-/media/Images/MEN/Editorial/Special-Projects/Issues/2016/06-01/Tiny-Home-Ideas-for-Inspired-Affordable-Homes-on-Wheels/TinyHomes-10-jpg.jpg?h=367&w=550&la=en&hash=4DCBEE6688B1C1F76009D4E0DDDB112BEE00F6E0']},
  { name: 'Surfer Retreat', description: 'radical wave hunter', address: 'Miami, Florida, USA',
    images: ['https://cdn1.theinertia.com/wp-content/uploads/2016/06/SB_EDITED.jpg']},
  { name: 'Family Blastoff!', description: 'many hidden compartments', address: 'Halifax, NS, Canada',
    images: ['https://cdn.shopify.com/s/files/1/1561/8759/files/4The_20_Ynez_Tiny_House_on_Wheels_by_Timbercraft_Tiny_Homes_1024x1024.jpg?v=1524231455']},
  { name: 'Pet Planet', description: 'great for you and your pet pal', address: 'Toronto, ON, Canada',
    images: ['https://cdn.shopify.com/s/files/1/1561/8759/files/Orono_Debut_Tiny_House_on_Wheels_by_Evergreen_Tiny_Homes_1024x1024.jpg?v=1547149787']},
  { name: 'Awesome Tiny Home', description: 'everything you need!', address: 'Kingston, ON, Canada',
    images: ['https://cdn.shopify.com/s/files/1/1561/8759/files/1_30_Breezeway_Tiny_House_on_Wheels_by_Tiny_Heirloom_1024x1024.jpg?v=1525655500']},
  { name: 'Man Cave To-Go', description: 'peaceful bro escape', address: 'Ajax, ON, Canada',
    images: ['https://images.dwell.com/photos-6133553759298379776/6377628355801133056-large/the-mohican-tiny-home-has-a-starting-price-of-dollar62000-and-its-made-by-amish-craftsmen-in-ohio-the-20-tiny-home-which-can-be-built-in-as-little-as-eight-weeks-has-an-unfinished-exterior-and-a-light-and-bright-minimalist-interior-that-packs-all-the-esse.jpg']},
  { name: 'We <3 Travel', description: 'pack up and go real quick!', address: 'New Jersey, NY, USA',
    images: ['https://images.dwell.com/photos-6133553759298379776/6377631386980962304-large/the-340-square-foot-greenmoxie-tiny-house-is-sustainably-built-and-it-can-operate-completely-off-the-grid-prices-for-the-customizable-dwelling-start-at-dollar65000.jpg']},
  { name: 'Toasty Road Home', description: 'great for winter escapes', address: 'North Bay, ON, Canada',
    images: ['https://i.insider.com/5fb6d53150e71a00115564d3?width=700']} ]

th_details.each do |th|
  tiny_home = TinyHome.new(
    name: th[:name],
    address: th[:address],
    description: th[:description] ,
    room_number: rand(1..2),
    price: rand(50..100),
    size: [80, 90, 100, 110, 120].sample
  )
  th[:images].each do |image|
    file = URI.open("#{image}")
    tiny_home.photos.attach(io: file, filename: "#{image.last(8)}", content_type: 'image/png')
  end
  tiny_home.user = User.all.sample
  tiny_home.save!
end

puts "#{TinyHome.all.count} tiny homes created!"

# BOOKINGS
puts 'creating bookings...'

10.times do
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

puts 'creating reviews...'

Booking.all.each do |booking|
  Review.new(
    comment: Faker::Restaurant.review,
    stars: rand(1..5),
    booking: booking
  )
end





