require 'rails_helper'

describe Inquiry, type: :model do
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:message) }
  it { should validate_presence_of(:name) }
end
