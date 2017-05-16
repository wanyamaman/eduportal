# Feature: State creation
#   As an admin
#   I want to create a new state
#   So I can add a new state to the application
feature 'State new' do
  before(:each) do
    @mod = FactoryGirl.create(:user, :moderator)
    @admin = FactoryGirl.create(:user, :admin)
  end

  # Scenario: Visit new state page
  #   Given I am an admin
  #   When I fill information for a state
  #   Then I can create a state
  scenario "admin can create a new state" do
    # Redirect visitors
    visit new_state_path
    expect(page).to have_current_path(new_user_session_path)

    # Redirect non-admin users
    signin(@mod.email, @mod.password)
    visit new_state_path
    expect(page).to have_current_path(root_path)
    signout

    # Allow admins to create
    signin(@admin.email, @admin.password)
    visit new_state_path
    expect(page).to have_content("New state")

    fill_in "state_name", with: "Kilifi"
    click_button "Create State"
    expect(State.first.name).to eq("Kilifi")
  end
end
