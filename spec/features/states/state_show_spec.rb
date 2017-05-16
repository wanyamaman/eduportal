# Feature: State profile
#   As a user
#   I want to view a state
#   So I can read up information based on it's profile
feature 'State show' do
  before(:each) do
    @user = FactoryGirl.create(:user)
    @state = FactoryGirl.create(:state)
  end

  # Scenario: Visit state page
  #   Given I am a user
  #   When I visit the state profile page
  #   Then I can read the states name
  scenario "user can view a state's profile" do
    visit state_path(@state)
    expect(page).to have_current_path(new_user_session_path)

    signin(@user.email, @user.password)
    visit state_path(@state)
    expect(page).to have_content("NY")
  end
end
