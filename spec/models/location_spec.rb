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
    expect(@location.address).to eq('New York, New York, United States')
  end
end
