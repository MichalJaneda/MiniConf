class ConferenceUser < ApplicationRecord
  enum rank: {regular: 0}

  belongs_to :conference
  belongs_to :user

  validate :user_is_not_host, :confirmation_date_and_confirmation

  def is_confirmed?
    (self.confirmed &&
        self.confirmation_date &&
        self.confirmation_date < Time.now) == true
  end

  private

  def confirmation_date_and_confirmation
    if (self.confirmed &&
        (!self.confirmation_date ||
            (self.confirmation_date && self.confirmation_date >= Time.now))) ||
        (!self.confirmed && self.confirmation_date)
      errors[:confirmation_date] << 'Invalid confirmation date'
    end
  end

  def user_is_not_host
    if self.conference&.host == self.user
      errors[:user] << 'User is already host'
    end
  end

end
