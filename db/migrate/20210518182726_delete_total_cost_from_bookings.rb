class DeleteTotalCostFromBookings < ActiveRecord::Migration[6.0]
  def change
    remove_column :bookings, :total_cost
  end
end
