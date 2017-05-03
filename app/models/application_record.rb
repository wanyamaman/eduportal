class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i
end
