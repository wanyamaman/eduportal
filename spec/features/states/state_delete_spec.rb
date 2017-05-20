# Feature: State delete
#   As an admin
#   I want to delete a state
#   So I can remove it from the application
feature "State delete" do
  let(:mod) { FactoryGirl.create(:user, :moderator) }
  let(:admin) { FactoryGirl.create(:user, :admin) }

  # Scenario: Visit state 'index' page
  #   Given I am an admin
  #   When I delete a state
  #   Then I should see a delete success message
  scenario "admin can delete state" do
    @state = FactoryGirl.create(:state)

    signin(mod.email, mod.password)
    visit states_path
    expect(page).to_not have_link('Destroy')
    signout

    signin(admin.email, admin.password)
    visit states_path
    click_link('Destroy')
    expect(page).to have_content('State was successfully destroyed.')
  end
end
