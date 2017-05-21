# Feature: State modification
#   As an admin
#   I want to edit a state
#   So I can update state information
feature "State edit" do
  let!(:state) { FactoryGirl.create(:state) }
  let(:mod) { FactoryGirl.create(:user, :moderator) }
  let(:admin) { FactoryGirl.create(:user, :admin) }

  # Scenario: Visit state 'edit' page
  #   Given I am not an admin
  #   When I visit the state edit page
  #   Then I am redirected to home
  scenario "non-admins are redirected" do
    signin(mod.email, mod.password)
    visit edit_state_path(state)
    expect(page).to have_current_path(root_path)
  end

  # Scenario: Visit state 'edit' page
  #   Given I am an admin
  #   When I fill information for a state
  #   Then I can update the name of a state
  scenario "admin can update a state" do
    signin(admin.email, admin.password)
    visit edit_state_path(state)
    expect(page).to have_content('Editing state')

    fill_in 'state_name', with: 'Gotham'
    click_button 'Update State'
    expect(state.reload.name).to eq('Gotham')
  end
end
