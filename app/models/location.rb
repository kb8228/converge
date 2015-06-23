class Location < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode, if: ->(obj){ obj.address.present? && obj.latitude.nil?}
  
  has_many :users
  has_many :invitees
  has_many :meetups
  has_many :establishments

end
