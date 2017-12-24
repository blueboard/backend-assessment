class Account < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  has_secure_password

  has_many :sessions
  has_many :rewards

  validates_presence_of :email, uniq: true
  validates_format_of :email, with: VALID_EMAIL_REGEX
end
