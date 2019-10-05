class Part < ApplicationRecord
  has_and_belongs_to_many :cars

  validates :part, presence: true, length: { minimum: 3 }
end
