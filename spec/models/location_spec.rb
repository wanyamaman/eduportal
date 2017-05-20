require 'rails_helper'

RSpec.describe Location, type: :model do
  let(:location) { FactoryGirl.build(:location) }
  let(:blank_location) { Location.new }
  let(:state) { FactoryGirl.build(:state) }

  it 'should belong to State' do
    expect(location).to belong_to :state
  end

  context "Geocoding" do
    it 'should return an address' do
      location.valid?
      expect(location.address).to eq('Broadway, New York, New York, United States')
    end

    it 'should require address data when no coordinates are provided' do
      blank_location.valid?

      expect(blank_location.errors).to include(:state, :city, :country)
      expect(blank_location.errors.messages[:state]).to include("can't be blank if no coordinates are provided")
    end

    it 'should forward geocode given an address' do
      loc = Location.new(street: "Broadway", city: "New York", state: state, country: "United States")
      loc.valid?

      expect(loc.latitude).to eq(40.7143528)
    end

    it 'should reverse geocode given coordinates' do
      loc = Location.new(latitude: 40.7143528, longitude: -74.0059731)
      loc.valid?

      expect(loc.address).to eq("Broadway, New York, New York, United States")
    end
  end
end
