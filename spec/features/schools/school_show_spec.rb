# Feature: School profile page
#   As a user/visitor
#   I want to visit a specific "school's" page
#   So I can view general information about the school
feature "School show" do
  let(:jms) { FactoryGirl.create(:jms, :with_logo, :with_banner) }

  # Scenario: Visit a "school's" page
  #   Given I am a visitor
  #   When I visit a "school's" page
  #   Then I see information 'about' the school
  scenario "visit a school's page" do
    visit school_path(jms)

    expect(page).to have_content 'JMS'
    expect(page).to have_content 'Search for a School'
    expect(page).to have_selector 'div#search'
    expect(page).to have_link 'About', count: 1, exact: true
    expect(page).to have_link 'News', count: 1
  end
end
