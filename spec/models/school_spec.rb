require 'rails_helper'

RSpec.describe School, type: :model do
  # Shoulda matchers tests for validity
  # Presence
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:about) }
  it { should validate_presence_of(:ownership) }
  it { should validate_presence_of(:level) }
  it { should validate_presence_of(:mode) }
  it { should validate_presence_of(:gender) }

  # Length
  it { should validate_length_of(:email).is_at_least(5).is_at_most(100) }
  it { should validate_length_of(:name).is_at_least(3).is_at_most(255) }
  it { should validate_length_of(:ownership).is_at_most(50) }
  it { should validate_length_of(:level).is_at_most(50) }
  it { should validate_length_of(:mode).is_at_most(50) }
  it { should validate_length_of(:gender).is_at_most(50) }

  # Numericality
  it { should validate_numericality_of(:phone) }

  # Inclusion
  it { should validate_inclusion_of(:ownership).in_array(%w(private public)) }
  it { should validate_inclusion_of(:level).in_array(%w(primary secondary pre-school all other)) }
  it { should validate_inclusion_of(:mode).in_array(%w(day boarding mixed other)) }
  it { should validate_inclusion_of(:gender).in_array(%w(male female mixed)) }

  it "must have a valid email" do
    @school = FactoryGirl.build(:school)

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
    @jms = FactoryGirl.build(:jms)
    info = %w(about news)

    expect(@jms.info_options).to match_array(info)
  end

  context "searching for a school" do
    let!(:school) { FactoryGirl.create(:school) }
    let!(:jms) { FactoryGirl.create(:jms) }

    example "by type" do
      query = School.index_query('level' => 'all')

      expect(query.first).to match(jms)
      expect(query.count).to eq(1)
      expect(School.index_query({}).count).to eq(2)
    end

    example "by case insentitive name" do
      query = School.index_query(name: "test school")

      expect(query.first).to match(school)
    end
  end
end
