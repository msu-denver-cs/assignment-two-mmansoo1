class Make < ApplicationRecord
  has_many :cars

  validates :make, presence: true, length: { minimum: 3 }
  validates :country, presence: true, length: { minimum: 4 }
end
