# Feature: Navigation links
#   As a visitor
#   I want to see navigation links
#   So I can find home, schools, about, blog or contact, and basic logging pages
feature 'Navigation links', :devise do

  # Scenario: View navigation links
  #   Given I am a visitor
  #   When I visit the home page
  #   Then I see "home," "Log in," and "Register"
  scenario 'view navigation links' do
    visit root_path
    expect(page).to have_link 'Home'
    expect(page).to have_link 'Log in'
    expect(page).to have_link 'Register'
    expect(page).to have_link 'Blog'
    expect(page).to have_link 'About Us'
    expect(page).to have_link 'Contact Us'
  end

end
