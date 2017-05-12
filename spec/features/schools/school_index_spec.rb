# Feature: School listing
#   As a user/visitor
#   I want to visit a 'schools' page
#   So I can view a list of schools
feature 'Schools index' do

  before(:each) do
    @school = FactoryGirl.create(:school)
    @admin = FactoryGirl.create(:user, :admin)
    @mod = FactoryGirl.create(:user, :moderator, email: "mail@gmail.com")
  end

  # Scenario: Visit the 'schools' page
  #   Given I am a visitor
  #   When I visit the 'schools' page
  #   Then I see "a list of schools"
  scenario 'visit the schools page' do
    visit schools_path
    expect(page).to have_content 'Search for a school'
    expect(page).to have_selector 'form#school-search-form'
  end

  # Scenario: Only editors can modify school content
  #   Given I am an editor [admin, moderator]
  #   When I visit the 'schools' page
  #   Then I see links to modify schools
  scenario 'only editors can see links to modify schools' do
    # Visitors cannot see anything
    visit schools_path
    expect(page).to_not have_link 'Add New School'
    expect(page).to_not have_link 'Delete School'
    expect(page).to_not have_link 'Edit School'

    # Admins can see everything
    signin(@admin.email, @admin.password)
    visit schools_path
    expect(page).to have_link 'Add New School'
    expect(page).to have_link 'Delete School'
    expect(page).to have_link 'Edit School'

    click_link 'Add New School'
    expect(page).to have_current_path(new_school_path)

    # Moderators should not see delete links
    signout
    signin(@mod.email, @mod.password)
    visit schools_path
    expect(page).to_not have_link 'Delete School'

  end

end
