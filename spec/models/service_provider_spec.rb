require 'rails_helper'

RSpec.describe ServiceProvider, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:services) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
