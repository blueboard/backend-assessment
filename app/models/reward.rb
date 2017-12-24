class Reward < ApplicationRecord
  belongs_to :account

  enum status: {
    waiting_to_be_approved: 0,
    approved: 1,
    denied: 2,
    sent: 3,
    redeemed: 4,
    completed: 5
  }

  scope :by_status, -> (status) { status.blank? ? all : where(status: status) }
end
