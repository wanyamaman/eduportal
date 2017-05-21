# Feature: Home page
#   As a visitor
#   I want to visit a home page
#   So I can learn more about the website and navigate to other pages
feature "Home page" do
  # Scenario: Visit the home page
  #   Given I am a visitor
  #   When I visit the home page
  #   Then I see "Our Latest Updates" and links to search for schools
  scenario "visit the home page and navigate to schools" do
    visit root_path

    expect(page).to have_content('Our Latest Updates')
    expect(page).to have_link('View Schools')

    click_link('View Schools')
    expect(page).to have_current_path(schools_path)
  end
end
