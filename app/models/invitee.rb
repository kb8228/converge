class Invitee < ActiveRecord::Base
  belongs_to :meetup
  belongs_to :location

  def send_invitation_text
    client = Twilio::REST::Client.new Rails.application.secrets.twilio_account_sid, Rails.application.secrets.twilio_auth_token

    client.messages.create(
      from: "+19179832815",
      to: "+1#{self.phone_number}", #in prod, can do self.phone
      body: "Hi, #{self.name}! You have been invited to hang out by #{self.meetup.user.name}! Please visit this link to accept, so we can find an ideal meeting location for you: http://converge-us.herokuapp.com/#/invitees/#{self.id}. Yours truly, team of Converge."
    )
  end

end
