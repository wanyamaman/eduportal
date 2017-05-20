# Feature: Location modification
#   As an editor
#   I want to modify a location
#   So I can update location information
feature 'State edit' do
  let(:user) { FactoryGirl.create(:user) }
  let(:mod) { FactoryGirl.create(:user, :moderator) }
  let(:location) { FactoryGirl.create(:location) }

  # Scenario: Visit location 'edit' page
  #   Given I am a user
  #   When I visit location edit page
  #   Then I am redirected to root page
  scenario "users are redirected" do
    signin(user.email, user.password)
    visit edit_location_path(location)

    expect(page).to have_current_path(root_path)
  end

  # Scenario: Visit location 'edit' page
  #   Given I am an editor
  #   When I fill information for a location
  #   Then I can update the name of a location
  scenario "editor can update a location" do
    signin(mod.email, mod.password)
    visit edit_location_path(location)
    expect(page).to have_content('Editing location')
    expect(page).to have_content('New York')

    fill_in 'location_latitude', with: 40.09846115112305
    fill_in 'location_longitude', with: -83.01747131347656
    click_button 'Update Location'
    expect(location.reload.state.name).to eq('Ohio')
  end
end
