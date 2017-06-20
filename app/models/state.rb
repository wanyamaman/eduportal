class State < ApplicationRecord
  has_many :locations
  has_paper_trail

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
