class ContactMailer < ApplicationMailer
  default to: 'inquiries@eduportal.co.ke'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.inquiry.subject
  #
  def new_inquiry(inquiry)
    @inquiry = inquiry
    subject = @inquiry.subject.blank? ? 'Inquiry' : @inquiry.subject
    mail from: @inquiry.email, subject: subject
  end
end
