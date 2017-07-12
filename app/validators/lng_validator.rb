class LngValidator < ActiveModel::EachValidator
  LONGITUDE_MAX = 180.00

  def validate_each(record, attribute, value)
    unless value&.between?(-LONGITUDE_MAX, LONGITUDE_MAX)
      record.errors[attribute] <<
          "#{value.nil? ? 'Nil' : value} is not between -#{LONGITUDE_MAX} - #{LONGITUDE_MAX}"
    end
  end
end