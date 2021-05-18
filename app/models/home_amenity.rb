class HomeAmenity < ApplicationRecord
  belongs_to :amenity
  belongs_to :tiny_home
end
