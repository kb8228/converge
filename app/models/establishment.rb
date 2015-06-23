class Establishment < ActiveRecord::Base
  has_many :meetups
  belongs_to :location
end
