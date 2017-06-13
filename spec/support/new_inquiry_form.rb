class NewInquiryForm
  include Capybara::DSL

  def initialize(name = 'sherlock',
                 subject = 'Investigation',
                 email = 'nobody@home.com',
                 message = 'Strange noises are back')
    @name = name
    @subject = subject
    @email = email
    @message = message
  end

  # Navigate to 'contact us' page
  def visit_page
    visit page_path('contact')
    self
  end

  # Fill in form with params values when present or use defaults
  def fill_in_with(params = {})
    fill_in 'inquiry_name', with: params.fetch(:name, @name)
    fill_in 'inquiry_subject', with: params.fetch(:subject, @subject)
    fill_in 'inquiry_email', with: params.fetch(:email, @email)
    fill_in 'inquiry_message', with: params.fetch(:message, @message)
    self
  end

  # Submit contact us form
  def submit
    click_button 'SEND'
    self
  end

  # Hash of default form values
  def default_params
    {
      name: @name,
      subject: @subject,
      email: @email,
      message: @message
    }
  end
end
