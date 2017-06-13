require 'rails_helper'

describe Inquiry, type: :model do
  let(:mail) { Inquiry.new(
                            name: 'Nathan',
                            email: 'abc@eduportal.co.ke',
                            message: 'Just checking the view.'
                          )
              }

  it { should validate_presence_of(:email) }
  it { should validate_length_of(:email).is_at_least(5).is_at_most(100) }
  it { should validate_presence_of(:message) }
  it { should validate_presence_of(:name) }
  it { should allow_value('edu.portal@info.co.ke').for(:email) }
  it { should_not allow_value('edu.portal@info').for(:email) }

  it "sends an email" do
    expect { mail.send_mail }.to change { ActionMailer::Base.deliveries.count }.by(1)
  end
end
