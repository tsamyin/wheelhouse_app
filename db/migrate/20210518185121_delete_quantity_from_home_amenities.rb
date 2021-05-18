class DeleteQuantityFromHomeAmenities < ActiveRecord::Migration[6.0]
  def change
    remove_column :home_amenities, :quantity
  end
end
