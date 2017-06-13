require 'rails_helper'
require_relative '../support/new_inquiry_form'

RSpec.describe ContactMailer, type: :mailer do
  describe "inquiry" do
    params = NewInquiryForm.new.default_params
    let(:enquiry) { Inquiry.new(params) }
    let(:mail) { ContactMailer.new_inquiry(enquiry) }

    it "renders the headers" do
      expect(mail.subject).to eq('Investigation')
      expect(mail.to).to eq(['inquiries@eduportal.co.ke'])
      expect(mail.from).to eq(['nobody@home.com'])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match('Strange noises are back')
    end

  end
end
