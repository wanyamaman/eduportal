class Inquiry
  include ActiveModel::Model

  attr_accessor :message, :email, :name, :subject

  validates :message, presence: true
  validates :email, length: 5..100, presence: true, format: ApplicationRecord::EMAIL_REGEX
  validates :name, presence: true

  def send_mail
    ContactMailer.new_inquiry(self).deliver_now
  end
end
