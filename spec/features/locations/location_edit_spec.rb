# Feature: Location modification
#   As an editor
#   I want to modify a location
#   So I can update location information
feature 'State edit' do
  before(:each) do
    @user = FactoryGirl.create(:user)
    @mod = FactoryGirl.create(:user, :moderator)
    @location = FactoryGirl.create(:location)
  end

  # Scenario: Visit location 'edit' page
  #   Given I am an editor
  #   When I fill information for a location
  #   Then I can update the name of a location
  scenario "editor can update a location" do
    # Redirect visitors
    visit edit_location_path(@location)
    expect(page).to have_current_path(new_user_session_path)

    # Redirect normal users
    signin(@user.email, @user.password)
    visit edit_location_path(@location)
    expect(page).to have_current_path(root_path)
    signout

    # Allow editors to view edit locations page
    signin(@mod.email, @mod.password)
    visit edit_location_path(@location)
    expect(page).to have_content("Editing location")
    expect(page).to have_content("New York")

    fill_in "location_latitude", with: 40.09846115112305
    fill_in "location_longitude", with: -83.01747131347656
    click_button "Update Location"
    expect(@location.reload.state.name).to eq("Ohio")
  end
end
