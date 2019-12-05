class Repair < ApplicationRecord
  # Direct associations

  belongs_to :client,
             :counter_cache => :services_count

  # Indirect associations

  # Validations

end
