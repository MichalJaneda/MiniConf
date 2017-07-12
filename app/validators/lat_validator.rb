class LatValidator < ActiveModel::EachValidator
  LATITUDE_MAX = 90.00

  def validate_each(record, attribute, value)
    unless value&.between?(-LATITUDE_MAX, LATITUDE_MAX)
      record.errors[attribute] <<
          "#{value.nil? ? 'Nil' : value} is not between -#{LATITUDE_MAX} - #{LATITUDE_MAX}"
    end
  end
end