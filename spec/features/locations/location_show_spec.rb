# Feature: Location profile
#   As a user
#   I want to view a location
#   So I can read up information based on it's profile
feature "Location show" do
  let(:user) { FactoryGirl.create(:user) }
  let(:location) { FactoryGirl.create(:location) }

  # Scenario: Visit location page
  #   Given I am a user
  #   When I visit the location profile page
  #   Then I can read the locations name
  scenario "user can view a location's profile" do
    visit location_path(location)
    expect(page).to have_current_path(new_user_session_path)

    signin(user.email, user.password)
    visit location_path(location)
    expect(page).to have_content('New York')
  end
end
