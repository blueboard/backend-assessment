class Session < ApplicationRecord
  belongs_to :account

  validates_presence_of :account_id, :token
  validates_uniqueness_of :token

  before_validation :generate_token, on: :create

  private

  def generate_token
    self.token = SecureRandom.hex(16)
  end
end
