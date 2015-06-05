class Location < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode
  
  belongs_to :user
  belongs_to :invitee
  belongs_to :meetup
  belongs_to :establishment

  # # check if location belongs to invitee
  # # check if invitee's meetup has user and all invitees location
  # # if so, put all those locations' lat's & lng's into array
  # # calculate center
  # Geocoder::Calculations.geographic_center([])
  # # create meetup location with these coords
end
