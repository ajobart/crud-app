class Car < ApplicationRecord
  belongs_to :user
  belongs_to :warehouse

  STATUS = ["Free", "Book"]

  validates :model, presence: true
  validates :year, presence: true
  validates :color, presence: true
  validates :status, inclusion: { in: STATUS }
end
