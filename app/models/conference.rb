class Conference < ApplicationRecord

  belongs_to :host, class_name: 'User', validate: true
  belongs_to :place, validate: true

  accepts_nested_attributes_for :place

  validates :name, length: { in: 1..120 }

  validates :starts_at,
            presence: true,
            not_before_now: true
end
