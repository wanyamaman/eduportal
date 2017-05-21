# Feature: Sign out
#   As a user
#   I want to sign out
#   So I can protect my account from unauthorized access
feature "Sign out", :devise do
  let(:user) { FactoryGirl.create(:user) }

  # Scenario: User signs out successfully
  #   Given I am signed in
  #   When I sign out
  #   Then I see a signed out message
  scenario "user signs out successfully" do
    signin(user.email, user.password)
    expect(page).to have_content(I18n.t('devise.sessions.signed_in'))
    click_link 'Log out'
    expect(page).to have_content(I18n.t('devise.sessions.signed_out'))
  end
end
