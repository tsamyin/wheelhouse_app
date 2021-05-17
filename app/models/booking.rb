class Booking < ApplicationRecord
  belongs_to :tiny_home
  belongs_to :user
end
