require 'rails_helper'

describe Inquiry, type: :model do
  it { should validate_presence_of(:email) }
  it { should validate_length_of(:email).is_at_least(5).is_at_most(100) }
  it { should validate_presence_of(:message) }
  it { should validate_presence_of(:name) }
end
