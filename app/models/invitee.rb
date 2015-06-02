class Invitee < ActiveRecord::Base
  belongs_to :meetup
  has_one :location
end
