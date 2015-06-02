class Meetup < ActiveRecord::Base
  belongs_to :user
  belongs_to :establishment
  has_many :invitees
  has_one :location
end
