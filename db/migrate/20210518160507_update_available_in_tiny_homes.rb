class UpdateAvailableInTinyHomes < ActiveRecord::Migration[6.0]
  def change
    change_column :tiny_homes, :available, :boolean, :default => true
  end
end
