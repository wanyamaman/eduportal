# Feature: Location index
#   As a user
#   I want to view list of locations
#   So I can select a state to view it's information
feature "Location index" do
  let(:user) { FactoryGirl.create(:user) }

  # Scenario: Visit location 'index' page
  #   Given I a user
  #   When I visit the location index page
  #   Then I can click on a location to view it's profile
  scenario "user can select a location to view it's profile" do
    @location = FactoryGirl.create(:location)
    visit locations_path
    expect(page).to have_current_path(new_user_session_path)

    signin(user.email, user.password)
    visit locations_path
    expect(page).to have_content('Listing locations')
    expect(page).to have_content('40.7143528')
  end
end
