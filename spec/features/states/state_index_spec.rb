# Feature: State listing
#   As a user
#   I want to view all states
#   So I can select a state to view it's profile
feature 'State index' do
  before(:each) do
    @user = FactoryGirl.create(:user)
    @state = FactoryGirl.create(:state)
  end

  # Scenario: Visit state 'index' page
  #   Given I am logged in
  #   When I visit the state index page
  #   Then I can click on a state to view it's profile
  scenario "user can select a state to view it's profile" do
    visit states_path
    expect(page).to have_current_path(new_user_session_path)

    signin(@user.email, @user.password)
    visit states_path
    expect(page).to have_content("Listing states")
    expect(page).to have_content("NY")

    click_link "Show"
    expect(page).to have_current_path(state_path(@state))
  end
end
