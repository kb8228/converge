class Meetup < ActiveRecord::Base
  has_many :invitees
  belongs_to :user
  belongs_to :establishment
  belongs_to :location

  def all_responded?
    #check if all invitees set their locations
    self.invitees.all? {|invt| invt.location}
  end

  def coordinates
    locations = []
    # find this meetup's user's location
    user_location = User.find(self.user.id).location
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
    self.location = Location.create(latitude: lat_n_lng[0], longitude: lat_n_lng[1])
    self.save()
  end

  def send_convergence_text
    client = Twilio::REST::Client.new(Figaro.env.twilio_account_sid, Figaro.env.twilio_auth_token)

    client.messages.create(
      from: "+12132634373",
      to: "+1#{self.user.phone_number}", #in prod, can do self.phone
      body: "Hi, #{self.user.name}! All your friends accepted your invitations and we found a perfect location for you all to meet! Please visit your meeting page link to see it and to find a great cafe or bar nearby: http://converge-us.herokuapp.com/#/meetups/#{self.id}"
    )
  end

end
