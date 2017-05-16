# Feature: Location index
#   As a user
#   I want to view list of locations
#   So I can select a state to view it's information
feature 'Location index' do
  before(:each) do
    @user = FactoryGirl.create(:user)
    @location = FactoryGirl.create(:location)
  end

  # Scenario: Visit location 'index' page
  #   Given I a user
  #   When I visit the location index page
  #   Then I can click on a location to view it's profile
  scenario "user can select a location to view it's profile" do
    visit locations_path
    expect(page).to have_current_path(new_user_session_path)

    signin(@user.email, @user.password)
    visit locations_path
    expect(page).to have_content("Listing locations")
    expect(page).to_not have_content("Edit")
    expect(page).to_not have_content("Destroy")
    expect(page).to have_content("40.7143528")

    click_link "Show"
    expect(page).to have_current_path(location_path(@location))
  end
end
