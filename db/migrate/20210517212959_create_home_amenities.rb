class CreateHomeAmenities < ActiveRecord::Migration[6.0]
  def change
    create_table :home_amenities do |t|
      t.integer :quantity
      t.references :amenity, null: false, foreign_key: true
      t.references :tiny_home, null: false, foreign_key: true

      t.timestamps
    end
  end
end
