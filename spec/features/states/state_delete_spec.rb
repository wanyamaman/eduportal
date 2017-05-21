# Feature: State delete
#   As an admin
#   I want to delete a state
#   So I can remove it from the application
feature "State delete" do
  let!(:state) { FactoryGirl.create(:state) }
  let(:mod) { FactoryGirl.create(:user, :moderator) }
  let(:admin) { FactoryGirl.create(:user, :admin) }

  # Scenario: Visit state 'index' page
  #   Given I am not an admin
  #   When I visit the state index page
  #   Then I should not see a link to destroy states
  scenario "non-admins cannot see link to delete" do
    signin(mod.email, mod.password)
    visit states_path

    expect(page).to_not have_link('Destroy')
  end

  # Scenario: Visit state 'index' page
  #   Given I am an admin
  #   When I delete a state
  #   Then I should see a delete success message
  scenario "admin can delete state" do
    signin(admin.email, admin.password)
    visit states_path
    click_link('Destroy')

    expect(page).to have_content('State was successfully destroyed.')
  end
end
