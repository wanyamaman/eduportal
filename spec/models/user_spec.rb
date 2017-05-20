describe User do
  before(:each) { @user = User.new(email: 'user@example.com') }

  subject { @user }

  it { should respond_to(:email) }
  it { should validate_uniqueness_of(:email).case_insensitive }
  it { should validate_presence_of(:email) }

  it do
    should define_enum_for(:role)
      .with([:staff, :moderator, :admin])
  end

  it do
    should validate_length_of(:password)
      .is_at_least(8)
  end

  it "should return email as a string" do
    expect(@user.email).to match('user@example.com')
  end

  it "should set a default role of 'staff'" do
    user = FactoryGirl.create(:user)
    expect(user.role).to eq('staff')
  end

  it "should only allow admins and moderators to be editors" do
    expect(@user.editor?).to be(false)

    admin = @user.dup
    mod = @user.dup

    admin.update(role: :admin)
    mod.update(role: :moderator)

    expect(admin.editor?).to be(true)
    expect(mod.editor?).to be(true)
  end
end
