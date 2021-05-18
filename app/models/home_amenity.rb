class HomeAmenity < ApplicationRecord
  belongs_to :amenity
  belongs_to :tiny_home
  validates :amenity, uniqueness: { scope: :tiny_home }
end
