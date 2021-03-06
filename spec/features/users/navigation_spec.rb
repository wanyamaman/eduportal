# Feature: Navigation links
#   As a logged in user
#   I want to see navigation links
#   So I can find home, user management, log out, schools, about and contact pages
feature "Navigation links", :devise do
  # Scenario: View navigation links as user
  #   Given I am signed in
  #   When I visit the home page
  #   Then I see "home," "Log out," "Edit Account," "Users," "Schools," "Blog"
  scenario "view navigation links as regular user" do
    user = FactoryGirl.create(:user)
    signin(user.email, user.password)
    visit root_path

    expect(page).to have_link('Edit account')
    expect(page).to have_link('Dashboard')
    expect(page).to have_link('Log out')
    expect(page).to have_link('Home')
    expect(page).to have_link('Schools')
    expect(page).to have_link('About Us')
    expect(page).to have_link('Contact Us')
  end
end
