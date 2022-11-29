class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :article
  enum status: {
    pending: 0,
    active: 1,
    archived: 2
  }
end
