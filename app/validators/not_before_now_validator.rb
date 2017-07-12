class NotBeforeNowValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value.nil? || value > Time.now
      record.errors[attribute] << 'Can not be before now'
    end
  end
end