# Feature: State modification
#   As an admin
#   I want to edit a state
#   So I can update state information
feature 'State edit' do
  before(:each) do
    @user = FactoryGirl.create(:user)
    @mod = FactoryGirl.create(:user, :moderator)
    @admin = FactoryGirl.create(:user, :admin)
    @state = FactoryGirl.create(:state)
  end

  # Scenario: Visit state 'edit' page
  #   Given I am an admin
  #   When I fill information for a state
  #   Then I can update the name of a state
  scenario "admin can update a state" do
    # Redirect visitors
    visit edit_state_path(@state)
    expect(page).to have_current_path(new_user_session_path)

    # Redirect normal users
    signin(@user.email, @user.password)
    visit edit_state_path(@state)
    expect(page).to have_current_path(root_path)
    signout

    # Redirect moderators
    signin(@mod.email, @mod.password)
    visit edit_state_path(@state)
    expect(page).to have_current_path(root_path)
    signout

    # Allow admins to edit states
    signin(@admin.email, @admin.password)
    visit edit_state_path(@state)
    expect(page).to have_content("Editing state")

    fill_in "state_name", with: "Gotham"
    click_button "Update State"
    expect(@state.reload.name).to eq("Gotham")
  end
end
