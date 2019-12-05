class CreateRepairs < ActiveRecord::Migration[5.1]
  def change
    create_table :repairs do |t|
      t.string :location
      t.string :repair_type
      t.float :price
      t.integer :client_id
      t.integer :service_provider_id
      t.string :car_type

      t.timestamps
    end
  end
end
