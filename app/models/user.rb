class User < ActiveRecord::Base

  has_secure_password # (validations: false) - this allowed user creation but pw digest is nil
  has_secure_token

  has_many :meetups, dependent: :destroy
  belongs_to :location

  def send_convergence_text
    client = Twilio::REST::Client.new(Figaro.env.twilio_account_sid, Figaro.env.twilio_auth_token)

    client.messages.create(
      from: "+19179832815",
      to: self.phone_number, #in prod, can do self.phone
      body: "Hi, #{self.name}! All your friends accepted your invitations and we found a perfect location for you all to meet! Please visit your meeting page link to see it and to find a great cafe or bar nearby: "
    )
  end

end
