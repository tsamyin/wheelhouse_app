class AddCoordinatesToTinyHomes < ActiveRecord::Migration[6.0]
  def change
    add_column :tiny_homes, :latitude, :float
    add_column :tiny_homes, :longitude, :float
  end
end
