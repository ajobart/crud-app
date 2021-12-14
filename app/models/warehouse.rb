class Warehouse < ApplicationRecord
  has_many :cars, dependent: :destroy

  validates :address, presence: true, uniqueness: true
  validates :capacity, presence: true
end
