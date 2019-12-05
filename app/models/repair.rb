class Repair < ApplicationRecord
  # Direct associations

  belongs_to :service_provider,
             :required => false,
             :counter_cache => :services_count

  belongs_to :client,
             :counter_cache => :services_count

  # Indirect associations

  # Validations

end
