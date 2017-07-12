class Place < ApplicationRecord
  belongs_to :city

  validates :city,
            presence: true
  validates :street,
            length: {maximum: 255},
            allow_blank: true

  with_options unless: Proc.new {|a| a.latitude.nil? && a.longitude.nil? } do |a|
    a.validates :latitude, lat: true
    a.validates :longitude, lng: true
  end

end
