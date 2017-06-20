# Feature: School listing
#   As a user/visitor
#   I want to visit a 'schools' page
#   So I can view a list of schools
feature "School index" do
  let!(:school) { FactoryGirl.create(:school) }
  let(:admin) { FactoryGirl.create(:user, :admin) }
  let(:mod) { FactoryGirl.create(:user, :moderator) }

  # Scenario: Visit the 'schools' page
  #   Given I am a visitor
  #   When I visit the 'schools' page
  #   Then I see "a list of schools"
  scenario 'visit the schools page' do
    visit schools_path
    expect(page).to have_content('Search for a school')
    expect(page).to have_selector('form#school-search-form')
  end
end
