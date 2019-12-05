class AddLocationLongitudeToRepair < ActiveRecord::Migration[5.1]
  def change
    add_column :repairs, :location_longitude, :float
  end
end
