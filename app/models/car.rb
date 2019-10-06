class Car < ApplicationRecord
  belongs_to :make
  has_and_belongs_to_many :parts

  validates :model, presence: true, length: { minimum: 2 }
  validates :vin, presence: true, numericality: true, length: { minimum: 11}
end
