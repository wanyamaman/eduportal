class State < ApplicationRecord
  has_many :locations

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
