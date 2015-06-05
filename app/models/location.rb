class Location < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode
  
  belongs_to :user
  belongs_to :invitee
  belongs_to :meetup
  belongs_to :establishment

end
