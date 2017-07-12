class Country < ApplicationRecord
  has_many :cities, inverse_of: :country

  validates :name,
            uniqueness: true,
            length: {in: (3..40)}
end
