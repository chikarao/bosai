class EvacuationPoint < ApplicationRecord
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode

  has_many :users
end
