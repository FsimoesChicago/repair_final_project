class AddServiceCountToServiceProviders < ActiveRecord::Migration[5.1]
  def change
    add_column :service_providers, :services_count, :integer
  end
end
