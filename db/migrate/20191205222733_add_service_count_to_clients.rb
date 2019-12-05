class AddServiceCountToClients < ActiveRecord::Migration[5.1]
  def change
    add_column :clients, :services_count, :integer
  end
end
