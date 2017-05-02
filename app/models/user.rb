class User < ApplicationRecord
  # User roles
  enum role: [:staff, :moderator, :admin]
  after_initialize :set_default_role, :if => :new_record?

  # Set a default user role of staff if none exist
  def set_default_role
    self.role ||= :staff
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :trackable, :validatable,
         password_length: 8..128

  # Returns true if user is either admin or moderator
  def editor?
    role != :staff.to_s
  end
end
