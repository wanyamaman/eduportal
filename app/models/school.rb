class School < ActiveRecord::Base

  # belongs_to :locations

  @@ownership_type = %w(private public)
  @@level_type = %w(primary secondary pre-school all other)
  @@mode_type = %w(day boarding mixed other)
  @@gender_type = %w(male female mixed)

  EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i
  validates :name, presence: true, length: 3..255
  validates :email, length: 5..100, format: EMAIL_REGEX
  validates :phone, numericality: {only_integer: true}
  validates :ownership, inclusion: {in: @@ownership_type},
            length: {maximum: 50},
            presence: true
  validates :level, inclusion: {in: @@level_type},
            length: {maximum: 50},
            presence: true
  validates :mode, inclusion: {in: @@mode_type},
            length: {maximum: 50},
            presence: true
  validates :gender, inclusion: {in: @@gender_type},
            presence: true,
            length: {maximum:50}
  validates :about, presence: true

  def self.ownership_options
    @@ownership_type.map { |o| [o,o] }
  end

  def self.level_options
    @@level_type.map { |l| [l,l] }
  end

  def self.mode_options
    @@mode_type.map { |m| [m,m] }
  end

  def self.gender_options
    @@gender_type.map { |g| [g,g] }
  end

end
