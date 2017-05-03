# Feature: Navigation links
#   As a visitor
#   I want to see navigation links
#   So I can find home, schools, about or contact, and basic logging pages
feature 'Navigation links', :devise do

  # Scenario: View navigation links
  #   Given I am a visitor
  #   When I visit the home page
  #   Then I see "home," "Log in," and "Register"
  scenario 'view navigation links' do
    visit root_path
    expect(page).to have_link 'Home', count: 2
    expect(page).to have_link 'Log in'
    expect(page).to have_link 'Register'
    expect(page).to have_link 'Schools'
    expect(page).to have_link 'About Us', count: 2
    expect(page).to have_link 'Contact Us', count: 2
  end

  # Scenario: Visit About page
  # Given I am a visitor
  # When I click on "About Us" link
  # Then I visit the about page
  scenario 'visit about page' do
    visit root_path
    click_link('About Us', match: :first)
    expect(page).to have_current_path(page_path('about'))
  end

  # Scenario: Visit Contact page
  # Given I am a visitor
  # When I click on "Contact Us" link
  # Then I visit the contact page
  scenario 'visit contact page' do
    visit root_path
    click_link('Contact Us', match: :first)
    expect(page).to have_current_path(page_path('contact'))
  end

  # Scenario: Visit School page
  # Given I am a visitor
  # When I click on "Schools" link
  # Then I visit the Schools listing page
  scenario 'visit schools page' do
    visit root_path
    click_link('Schools', match: :first)
    expect(page).to have_current_path(schools_path)
  end


end
