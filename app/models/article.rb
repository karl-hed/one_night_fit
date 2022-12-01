class Article < ApplicationRecord
  CATEGORIES = %w[clothing accessories shoes].freeze
  has_many_attached :photos
  belongs_to :user
  has_many :bookings, dependent: :destroy
  # validates :name, presence: true
  # validates :price, presence: true
  # validates :description, length: { minimum: 20 }
  # validates :category, inclusion: { in: CATEGORIES }
end
