# Feature: State delete
#   As an admin
#   I want to delete a state
#   So I can remove it from the application
feature 'State delete' do
  before(:each) do
    @mod = FactoryGirl.create(:user, :moderator)
    @admin = FactoryGirl.create(:user, :admin)
    @state = FactoryGirl.create(:state)
  end

  # Scenario: Visit state 'index' page
  #   Given I am an admin
  #   When I delete a state
  #   Then I should see a delete success message
  scenario "admin can delete state" do
    signin(@mod.email, @mod.password)
    visit states_path
    expect(page).to_not have_link("Destroy")
    signout

    signin(@admin.email, @admin.password)
    visit states_path
    click_link("Destroy")
    expect(page).to have_content("State was successfully destroyed.")
  end
end
