class AddLocationFormattedAddressToRepair < ActiveRecord::Migration[5.1]
  def change
    add_column :repairs, :location_formatted_address, :string
  end
end
