class Request < ApplicationRecord
  belongs_to :user
  has_many :items_requests, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :items, through: :items_requests

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  accepts_nested_attributes_for :items_requests, reject_if: :all_blank, allow_destroy: true
end
