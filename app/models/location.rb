class Location < ActiveRecord::Base
  belongs_to :user
  belongs_to :invitee
  belongs_to :meetup
  belongs_to :establishment
end
