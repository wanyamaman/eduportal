require 'rails_helper'

RSpec.describe Location, type: :model do

  before(:each) do
    @location = FactoryGirl.build :location
  end

  it 'should belong to State' do
    expect(@location).to belong_to :state
  end

  it 'should return an address' do
    @location.save
    expect(@location.address).to eq('Broadway, New York, New York, United States')
  end

  it 'should require address data when no coordinates are provided' do
    loc = Location.new
    loc.save
    expect(loc.errors).to include(:state, :city, :country)
    expect(loc.errors.messages[:state]).to include("can't be blank if no coordinates are provided")
  end

  it 'should geocode given an address' do
    state = FactoryGirl.build(:state)
    loc = Location.new(street: "Broadway", city: "New York", state: state, country: "United States")
    loc.save

    expect(loc.reload.latitude).to eq(40.7143528)
  end

  it 'should reverse geocode given coordinates' do
    state = FactoryGirl.build(:state)
    loc = Location.new(latitude: 40.7143528, longitude: -74.0059731)
    loc.save

    expect(loc.reload.address).to eq("Broadway, New York, New York, United States")
  end
end
