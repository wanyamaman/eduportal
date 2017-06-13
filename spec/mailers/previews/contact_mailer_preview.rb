# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/contact_mailer/inquiry
  def inquiry
    inquiry = Inquiry.new(
                          email: "abc@eduportal.co.ke",
                          subject: "Preview",
                          message: "Just checking the view",
                          name: "Nathan")
    ContactMailer.new_inquiry(inquiry)
  end
end
