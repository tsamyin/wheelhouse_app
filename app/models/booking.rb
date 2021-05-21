class Booking < ApplicationRecord
  belongs_to :tiny_home
  belongs_to :user
  has_one :review, dependent: :destroy

  validates :start_date, presence: true
  validates :end_date, presence: true, after_date: :start_date

  def total_cost
    (self.end_date - self.start_date).to_i * self.tiny_home.price
  end
end
