# Feature: Location creation
#   As an editor
#   I want to create a new location
#   So I can add a new location to the application
feature 'Location new' do
  before(:each) do
    @user = FactoryGirl.create(:user)
    @mod = FactoryGirl.create(:user, :moderator)
  end

  # Scenario: Visit new location page
  #   Given I am an editor
  #   When I fill information for a location
  #   Then I can create a location
  scenario "editor can create a location" do
    # Redirect visitors
    visit new_location_path
    expect(page).to have_current_path(new_user_session_path)

    # Allow editors to create
    signin(@mod.email, @mod.password)
    visit new_location_path
    expect(page).to have_content("New location")

    expect {
      fill_in "location_latitude", with: 40.09846115112305
      fill_in "location_longitude", with: -83.01747131347656
      click_button "Create Location"
    }.to change {
      Location.count
    }.from(0).to(1)
  end
end
