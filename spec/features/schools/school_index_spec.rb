# Feature: School listing
#   As a user/visitor
#   I want to visit a 'schools' page
#   So I can view a list of schools
feature "School index" do
  before(:each) do
    @school = FactoryGirl.create(:school)
  end

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

  # Scenario: Vistors cannot see links to modify school content
  #   Given I am a visitor
  #   When I visit the 'schools' page
  #   Then I cannot see links to modify schools
  scenario "visitors cannot see links to edit schools" do
    visit schools_path

    expect(page).to_not have_link('Add New School')
    expect(page).to_not have_link('Delete School')
    expect(page).to_not have_link('Edit School')
  end

  # Scenario: Admins can modify, create and delete school content
  #   Given I am an admin admin
  #   When I visit the 'schools' page
  #   Then I see links to modify schools
  scenario "admins can see links to CRUD schools" do
    signin(admin.email, admin.password)
    visit schools_path

    expect(page).to have_link('Add New School')
    expect(page).to have_link('Delete School')
    expect(page).to have_link('Edit School')

    click_link('Add New School')
    expect(page).to have_current_path(new_school_path)
  end

  # Scenario: Editors can only modify school content
  #   Given I am a moderator
  #   When I visit the 'schools' page
  #   Then I cannot see links to delete schools
  scenario "moderators cannot delete schools" do
    signin(mod.email, mod.password)
    visit schools_path

    expect(page).to_not have_link('Delete School')
  end
end
