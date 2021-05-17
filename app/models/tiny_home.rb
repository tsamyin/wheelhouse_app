class TinyHome < ApplicationRecord
  belongs_to :user
  has_many :amenities, through: :home_amenities
  has_many :users, :bookings, :home_amenities
  has_many :users, through: :bookings
end
