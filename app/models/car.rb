class Car < ApplicationRecord
  belongs_to :make
  has_and_belongs_to_many :parts

  validates :model, presence: true, length: { minimum: 2 }
  validates :vin, presence: true, length: { minimum: 11 }, numericality: true
  validates :parts, acceptance: true
end
