class RemoveLatAndLngFromLocations < ActiveRecord::Migration
  def change
    remove_column :locations, :lat, :float
    remove_column :locations, :lng, :float
  end
end
