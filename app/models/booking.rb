class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :article
  enum status: {
    pending: 0,
    accepted: 1,
    rejected: 2
  }
end
