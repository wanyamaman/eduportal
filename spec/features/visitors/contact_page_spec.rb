# Feature: 'Contact' page
#   As a visitor
#   I want to visit an 'Contact' page
#   So I can contact eduportal staff
feature 'Contact page' do

  # Scenario: Visit the 'contact' page
  #   Given I am a visitor
  #   When I visit the 'contact' page
  #   Then I see "A contact form"
  scenario 'visit the contact page' do
    visit page_path('contact')
    expect(page).to have_title 'Contact'
    expect(page).to have_selector 'form#contact-form'
  end

  # Scenario: Visitor can submit form with valid credentials
  #   Given I am a visitor
  #   When I visit the 'contact' page
  #   Then I see "A contact form"
  scenario 'visitor can submit form with valid credentials' do
    visit page_path('contact')
    submit_form contact_info

    expect(page).to have_current_path(root_path)
    expect(page).to have_content "Thank you"
  end

  # Scenario: Visitor cannot submit form without email
  #   Given I am a visitor
  #   When I complete the form without an email
  #   Then I see an error message
  scenario 'visitor cannot submit form without email', driver: :webkit do
    visit page_path('contact')
    submit_form contact_info(email: nil)

    expect(page).to have_content "Email is too short"
  end

  # Scenario: Visitor cannot submit form without name
  #   Given I am a visitor
  #   When I complete the form without a name
  #   Then I see an error message
  scenario 'visitor cannot submit form without name', driver: :webkit do
    visit page_path('contact')
    submit_form contact_info(name: nil)

    expect(page).to have_content "Name can't be blank"
  end

  # Scenario: Visitor cannot submit form without message
  #   Given I am a visitor
  #   When I complete the form without a message
  #   Then I see an error message
  scenario 'visitor cannot submit form without message', driver: :webkit do
    visit page_path('contact')
    submit_form contact_info(message: nil)

    expect(page).to have_content "Message can't be blank"
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
