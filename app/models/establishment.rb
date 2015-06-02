class Establishment < ActiveRecord::Base
  has_many :meetups
  has_one :location
end
