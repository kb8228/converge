class Meetup < ActiveRecord::Base
  belongs_to :user
  belongs_to :establishment
  has_many :invitees
  has_one :location

  def all_responded?
    #check if all invitees responded
    self.invitees.all? {|invt| invt.location}
  end

  def coordinates
    locations = []
    # find this meetup's user's location
    user_location = Location.find_by_user_id(self.user.id)
    # push user_location to locations array
    locations.push([user_location.latitude, user_location.longitude])
    # pull coords for all invitees and push them to array
    self.invitees.each do |invt|
      locations.push([invt.location.latitude, invt.location.longitude])
    end
    locations
  end

  def find_center(coords)
    lat_n_lng = Geocoder::Calculations.geographic_center(coords)
    location = Location.create(meetup_id: self.id, latitude: lat_n_lng[0], longitude: lat_n_lng[1])
  end
end
