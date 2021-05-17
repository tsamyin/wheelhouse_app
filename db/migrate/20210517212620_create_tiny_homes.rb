class CreateTinyHomes < ActiveRecord::Migration[6.0]
  def change
    create_table :tiny_homes do |t|
      t.string :name
      t.string :address
      t.text :description
      t.boolean :available
      t.integer :price
      t.integer :room_number
      t.integer :size
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
