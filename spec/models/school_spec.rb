require 'rails_helper'

RSpec.describe School, type: :model do
  # Set up
  let(:school) { FactoryGirl.build(:school) }
  let(:jms) { FactoryGirl.build(:jms) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:about) }

  it "must have a valid email" do
    expect(school).to be_valid

    school.email = "@gc.com"
    expect(school).to_not be_valid

    school.email = "test@.com"
    expect(school).to_not be_valid

    school.email = "test@gc."
    expect(school).to_not be_valid

    school.email = "test@gc"
    expect(school).to_not be_valid
  end

  it "must have a valid ownership type" do
    school.ownership = "mixed"
    expect(school).to_not be_valid

    school.ownership = ''
    expect(school).to_not be_valid
  end

  it "must have a valid mode" do
    school.mode = ''
    expect(school).to_not be_valid

    school.mode = 'afternoon'
    expect(school).to_not be_valid
  end

  it "must have a valid gender" do
    school.gender = ''
    expect(school).to_not be_valid

    school.gender = 'both'
    expect(school).to_not be_valid
  end

  it "must have a valid level" do
    school.level = ''
    expect(school).to_not be_valid

    school.level = 'university'
    expect(school).to_not be_valid
  end

  it "lists an array of ownership options" do
    ownerships = [['any', ''], ['private', 'private'], ['public', 'public']]

    expect(School.ownership_options).to match_array(ownerships)
  end

  it "lists an array of level options" do
    levels = [['any', ''], ['primary', 'primary'], ['secondary', 'secondary'],
              ['pre-school', 'pre-school'], ['all', 'all'], ['other', 'other']]

    expect(School.level_options).to match_array(levels)
  end

  it "lists an array of gender options" do
    genders = [['any', ''], ['male', 'male'], ['female', 'female'],
                ['mixed', 'mixed']]

    expect(School.gender_options).to match_array(genders)
  end

  it "lists an array of mode options" do
    modes = [['any', ''], ['day', 'day'], ['boarding', 'boarding'],
              ['mixed', 'mixed'], ['other', 'other']]

    expect(School.mode_options).to match_array(modes)
  end

  it "lists a filtered array of info options" do
    info = %w(about news)

    expect(jms.info_options).to match_array(info)
  end

  it "lists schools according to search filters" do
    # Persist data
    school.save
    jms.save

    # Search by types
    query = School.index_query('level' => 'all')

    expect(query.first).to match(jms)
    expect(query.count).to eq(1)
    expect(School.index_query({}).count).to eq(2)

    # Search by #caseInsensitive name
    query = School.index_query(name: "test school")

    expect(query.first).to match(school)
  end
end
