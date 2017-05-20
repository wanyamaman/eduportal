# Feature: 'Contact' page
#   As a visitor
#   I want to visit an 'Contact' page
#   So I can contact eduportal staff
feature 'Contact page' do
  # Scenario: Visit the 'contact' page
  #   Given I am a visitor
  #   When I visit the 'contact' page
  #   Then I see "A contact form"
  scenario "visit the contact page" do
    visit page_path('contact')

    expect(page).to have_title('Contact')
    expect(page).to have_selector('form#contact-form')
  end

  # Scenario: Visitor can submit form with valid credentials
  #   Given I am a visitor
  #   When I visit the 'contact' page
  #   Then I see "A contact form"
  scenario "visitor can submit form with valid credentials" do
    visit page_path('contact')
    submit_form contact_info

    expect(page).to have_current_path(root_path)
    expect(page).to have_content('Thank you')
  end

  def submit_form(options = {})
    fill_in 'inquiry_name', with: options[:name]
    fill_in 'inquiry_email', with: options[:email]
    fill_in 'inquiry_message', with: options[:message]
    click_button 'SEND'
  end

  def contact_info(options = {})
    {
      name: 'Mr Anon',
      email: 'visitor@example.com',
      message: 'Why hello there!'
    }.merge(options)
  end
end
