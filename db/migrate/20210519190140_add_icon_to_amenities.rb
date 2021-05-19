class AddIconToAmenities < ActiveRecord::Migration[6.0]
  def change
    add_column :amenities, :icon, :string
  end
end
