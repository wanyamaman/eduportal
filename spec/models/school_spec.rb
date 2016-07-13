require 'rails_helper'

RSpec.describe School, type: :model do

  before(:each) do
    @school = FactoryGirl.build :school
  end

  it "must have a valid email" do
    expect(@school).to be_valid

    @school.email = "@gc.com"
    expect(@school).to_not be_valid

    @school.email = "test@.com"
    expect(@school).to_not be_valid

    @school.email = "test@gc."
    expect(@school).to_not be_valid

    @school.email = "test@gc"
    expect(@school).to_not be_valid
  end

  it "must have a valid ownership type" do
    @school.ownership = "mixed"
    expect(@school).to_not be_valid

    @school.ownership = ''
    expect(@school).to_not be_valid
  end

  it "must have a valid mode" do
    @school.mode = ''
    expect(@school).to_not be_valid

    @school.mode = 'afternoon'
    expect(@school).to_not be_valid
  end

  it "must have a valid gender" do
    @school.gender = ''
    expect(@school).to_not be_valid

    @school.gender = 'both'
    expect(@school).to_not be_valid
  end

  it "must have a valid level" do
    @school.level = ''
    expect(@school).to_not be_valid

    @school.level = 'university'
    expect(@school).to_not be_valid
  end

  it { should validate_presence_of(:name) }

end
