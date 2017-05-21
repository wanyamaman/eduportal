# Feature: Location delete
#   As an admin
#   I want to delete a location
#   So I can remove it from the application
feature 'Location delete' do
  let(:mod) { FactoryGirl.create(:user, :moderator) }
  let(:admin) { FactoryGirl.create(:user, :admin) }

  # Scenario: Visit location 'index' page
  #   Given I am an admin
  #   When I delete a location
  #   Then I should see a delete success message
  scenario "admin can delete location" do
    FactoryGirl.create(:location)

    # Redirect moderators
    signin(mod.email, mod.password)
    visit locations_path
    expect(page).to_not have_link('Destroy')
    signout

    # Allow admins to delete
    signin(admin.email, admin.password)
    visit locations_path
    click_link('Destroy')
    expect(page).to have_content('Location was successfully destroyed.')
  end
end
