class TinyHome < ApplicationRecord
  belongs_to :user
  has_many :home_amenities, dependent: :destroy
  has_many :amenities, through: :home_amenities
  has_many :users
  has_many :bookings
  has_many :users, through: :bookings
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
