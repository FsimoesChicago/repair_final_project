require 'rails_helper'

RSpec.describe Repair, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:service_provider) }

    it { should belong_to(:client) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
