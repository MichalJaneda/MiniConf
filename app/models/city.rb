class City < ApplicationRecord
  belongs_to :country
  has_many :places, inverse_of: :city

  validates :country, presence: true
  validates :name,
            length: { in: 2..85 },
            uniqueness: {scope: :country, message: 'Can be one per country'}
end
