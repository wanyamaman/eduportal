describe User do

  before(:each) { @user = User.new(email: 'user@example.com') }

  subject { @user }

  it { should respond_to(:email) }
  it { should validate_uniqueness_of(:email).case_insensitive }
  it { should validate_presence_of(:email) }

  it do
    should define_enum_for(:role).
      with([:staff, :moderator, :admin])
  end

  it do
    should validate_length_of(:password).
      is_at_least(8)
  end

  it "#email returns a string" do
    expect(@user.email).to match 'user@example.com'
  end

  it "sets a default role of 'staff'" do
    user = FactoryGirl.create(:user)
    expect(user.role).to eq "staff"
  end


end
