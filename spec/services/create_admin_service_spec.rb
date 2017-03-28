require 'rails_helper'

describe CreateAdminService do

  it "should create a valid admin" do
    user = CreateAdminService.new.call

    expect(user).to be_valid
    expect(user.role).to eq('admin')
  end

  it "should not create an admin in production without ENV variables" do
    # In production if ENV variables are ommited, default values are nil
    allow(Rails.application.secrets).to receive(
                                              :admin_password).and_return(nil)
    allow(Rails.application.secrets).to receive(
                                              :admin_email).and_return(nil)

    expect{
      CreateAdminService.new.call
    }.to raise_error(ActiveRecord::RecordInvalid)
  end

end
